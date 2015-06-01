class ChatsController < ApplicationController
  before_action :ensure_admin!, only: [:index, :update, :destroy]
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
    @chat = Chat.new(subject: @contact.subject,contact_id: @contact.from_id, admin_id: current_user.id)
    @chat.save
    note = Notification.new(message: "A chat area for you contact has been generated.", link: "<a href=\"\/chats\/#{@chat.id}\">Go to Chat<\/a>", user_id: @chat.contact_id)
    note.save
    @message = Message.new(content: @contact.message,chat_id: @chat.id,user_id: @chat.contact_id)
    @message.save
    redirect_to new_message_url(chat_id: @chat.id)
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
    messages = Message.where(chat_id: @chat.id)
    messages.each do |message|
      message.destroy
    end
    @chat.destroy
    respond_with(@chat)
  end

  private
    def set_chat
      @chat = Chat.find(params[:id])
    end
end
