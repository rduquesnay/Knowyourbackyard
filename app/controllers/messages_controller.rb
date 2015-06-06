class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :mail]
  before_action :ensure_admin!, only: :destroy
  respond_to :html
  def new
    @message = Message.new()
    @ids = {chat_id: params[:chat_id], user_id: current_user.id}
    respond_with(@message)
  end

  def create
    @message = Message.new(message_params)
    @message.save
    @chat = Chat.find(@message.chat_id)
    if @message.user_id == @chat.admin_id
      other_user = @chat.contact_id
    else
      other_user = @chat.admin_id
    end
    note = Notification.new(message: "A new message has been created in the chat area.", link: "<a class=\"btn btn-primary\" href=\"\/chats\/#{@message.chat_id}\">Go to Chat<\/a>", user_id: other_user)
    note.save
    redirect_to @chat
  end
  
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    respond_with(@message)
  end

  private
    def message_params
      params.require(:message).permit(:content,:user_id,:chat_id)
    end
end
