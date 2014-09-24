class AddWykoptagIdToTags < ActiveRecord::Migration
  def change
    add_column :tags, :wykoptag_id, :integer
  end
end
