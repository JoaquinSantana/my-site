class Change < ActiveRecord::Migration
  def change
  	change_column :tags, :description, :text
  	change_column :tags, :url, :text
  	change_column :tags, :source_url, :text
  	change_column :tags, :preview, :text
  	change_column :tags, :foto, :text
  end
end
