class ContactsController < ApplicationController
  before_action :ensure_admin!, only: [:index,:show,:destroy]
  before_action :set_contact, only:[:show,:edit,:update,:destroy]
  respond_to :html

  def index
    @contacts =Contact.all
    respond_with(@contacts)
  end

  def show
    respond_with(@contact)
  end

  def new
    @contact=Contact.new
    respond_with(@contact)
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path
    else
      redirect_to 'new'
    end
  end

  def update
    @contact.update(contact_params)
    respond_with(@contact)
  end

  def destroy
    @contact.destroy
    respond_with(@contact)
  end
  private
    def set_contact
      @contact = Contact.find(params[:id])
    end
    def contact_params
      params.require(:contact).permit(:subject,:message,:firstname,:lastname,:email,:from_id,:username)
    end
end
