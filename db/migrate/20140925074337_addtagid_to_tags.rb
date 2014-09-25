class AddtagidToTags < ActiveRecord::Migration
  def change
  	add_column :tags, :tagid, :integer
  end
end
