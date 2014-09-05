class Contact < ActiveRecord::Base
	validates :podpis, presence: { message: "Pole podpis nie może być puste" }
	validates :wiadomosc, presence: { message: "Pole wiadomość nie może być puste" }
  validates :email, :email_format => { :message => 'Wpisz prawidłowy email' }
  validates :nickname, length: { maximum: 0, :message => "Witam robota" }

  after_create :send_email


  def send_email
  	ContactMailer.new_contact(self).deliver
  end
end
