class ContactMailsController < ApplicationController
  respond_to :html
  def new
    @message = Message.new()
    @ids = {user_id: current_user.id, contact_id: params[:contact_id]}
    respond_with(@message)
  end

  def create
    binding.pry
    contact = Contact.find(mail_params[:contact_id])
    admin = User.find(mail_params[:user_id])
    message = Message.new(content: mail_params[:content])
    Contactmailer.reply({message: message, to: contact, from: admin}).deliver_now
    redirect_to contacts_path
  end
  
  private
  def mail_params
    params.permit(:content,:user_id,:contact_id)
  end
end
