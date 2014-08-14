class Post < ActiveRecord::Base
  validates :title, presence: { message: "Pole tytuł nie może być puste" }
  validates :body, presence: { message: "Pole body nie może być puste" }

end