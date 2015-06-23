class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :short_desc
      t.text :description
      t.string :site
      t.string :foto

      t.timestamps
    end
  end
end
