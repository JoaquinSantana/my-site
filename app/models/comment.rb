class Comment < ActiveRecord::Base
	
	validates :podpis, presence: { message: "Musisz się podpisać" }
  validates :komentarz, presence: { message: "Pole komentarz musi być uzupełnione" }
  
  belongs_to :post

	acts_as_tree order: 'created_at ASC'

  scope :persisted, -> { where "id IS NOT NULL" }


end
