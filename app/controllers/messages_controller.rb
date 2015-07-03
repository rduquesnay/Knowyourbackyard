class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :ensure_admin!, only: :destroy
  respond_to :html

  def new
    @message = Message.new()
    @ids = {chat_id: params[:chat_id], user_id: current_user.id}
    respond_with(@message)
  end

  def create
    @message = Message.new(message_params)
    @chat = Chat.find(@message.chat_id)
    ActiveRecord::Base.transaction do
      if !@message.save
        raise ActiveRecord::Rollback
      end
      if @message.user_id == @chat.admin_id
        other_user = @chat.contact_id
      else
        other_user = @chat.admin_id
      end
      notice = Notice.new({type: "New Message", link_id: @message.chat_id, to_user: other_user})
      if !notice.send
        raise ActiveRecord::Rollback
      end
    end
    redirect_to @chat
  end
  
  def destroy
    @message = Message.find(params[:id])
    @chat = Chat.find(@message.chat_id)
    @message.destroy
    redirect_to @chat
  end

  private
    def message_params
      params.require(:message).permit(:content,:user_id,:chat_id)
    end
end
