class ContactsController < ApplicationController

  def new
  end

  def create
  	@contact = Contact.new(contact_params)
  	if @contact.save
      redirect_to root_url
      flash[:success] = "Dziękuję za wysłanie wiadomości"
    else
      render 'homes/home'
    end
  end

  private

  def contact_params
  	params.require(:contact).permit(:podpis, :wiadomosc, :email, :nickname)
  end
end
