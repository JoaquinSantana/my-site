class AddAuthorToTags < ActiveRecord::Migration
  def change
    add_column :tags, :author, :string
  end
end
