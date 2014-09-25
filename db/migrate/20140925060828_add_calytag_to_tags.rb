class AddCalytagToTags < ActiveRecord::Migration
  def change
    add_column :tags, :calytag, :text
  end
end
