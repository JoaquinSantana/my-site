class ContactMailer < ActionMailer::Base
  default to: "sanczopan@gmail.com"


  def new_contact(contact)
  	@contact = contact
  	mail(from: @contact.email, subject: "#{contact.wiadomosc}")
  end
end
