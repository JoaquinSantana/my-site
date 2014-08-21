class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :podpis
      t.text :komentarz
      t.references :post, index: true

      t.timestamps
    end
  end
end
