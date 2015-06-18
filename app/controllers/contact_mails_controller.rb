class ContactMailsController < ApplicationController
  before_action :ensure_admin!
  respond_to :html

  def new
    @message = Message.new()
    @contact = Contact.find(params[:contact_id])
    @user = User.find(current_user.id)
    respond_with(@message)
  end

  def create
    contact = Contact.find(mail_params[:contact])
    admin = User.find(mail_params[:from])
    message = Message.new(content: mail_params[:content])
    Contactmailer.reply({message: message, to: contact, from: admin}).deliver_now
    redirect_to contacts_path
  end
  
  private
  def mail_params
    params.permit(:content,:from,:contact)
  end
end
