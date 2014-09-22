class Post < ActiveRecord::Base
  validates :title, presence: { message: "Pole tytuł nie może być puste" }
  validates :body, presence: { message: "Pole body nie może być puste" }
  validates :description, presence: { message: "Pole opisu nie może być puste" }, length: { maximum: 155, message: "Opis może zawierać tylko 50 znaków" }
 	validates :user, presence: true
 	
  default_scope { order('created_at DESC') }

  has_many :comments
  belongs_to :user

end