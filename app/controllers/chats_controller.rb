class ChatsController < ApplicationController
  before_action :ensure_admin!, only: [:new, :create, :index, :update, :destroy]
  before_action :authenticate_user!, only: :show
  before_action :set_chat, only: [:show, :destroy]
  respond_to :html

  def index
    @chats = Chat.all
    respond_with(@chats)
  end

  def show
    @messages = Message.where(chat_id: @chat.id)
    @admin = User.find(@chat.admin_id)
    @contact = User.find(@chat.contact_id)
    respond_with(@chat)
  end

  def new
    @contact = Contact.find(params[:contact_id])
    @chat = Chat.new(subject: @contact.subject, contact_id: @contact.from_id, admin_id: current_user.id)
    ActiveRecord::Base.transaction do
      @chat.save
      notice = Notice.new({type: "New Chat", link_id: @chat.id, to_user: @chat.contact_id})
      if !notice.send
        raise ActiveRecord::Rollback
      end
      @message = Message.new(content: @contact.message,chat_id: @chat.id,user_id: @chat.contact_id)
      if !@message.save
        raise ActiveRecord::Rollback
      end
    end
    redirect_to new_message_url(chat_id: @chat.id)
  end

  def destroy
    messages = Message.where(chat_id: @chat.id)
    messages.each do |message|
      message.destroy
    end
    @chat.destroy
    redirect_to chats_path
  end

  private
    def set_chat
      @chat = Chat.find(params[:id])
    end
end
