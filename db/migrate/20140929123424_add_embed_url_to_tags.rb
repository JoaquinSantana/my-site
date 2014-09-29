class AddEmbedUrlToTags < ActiveRecord::Migration
  def change
    add_column :tags, :embedurl, :text
  end
end
