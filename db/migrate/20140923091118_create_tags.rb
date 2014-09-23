class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :nazwa
      t.string :title
      t.string :description
      t.text :body
      t.string :url
      t.string :source_url
      t.string :preview
      t.string :foto

      t.timestamps
    end
  end
end
