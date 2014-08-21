class ChangePostBodyToText < ActiveRecord::Migration
  def change
  	change_column :posts, :body, :text, :limit => nil
  end
end
