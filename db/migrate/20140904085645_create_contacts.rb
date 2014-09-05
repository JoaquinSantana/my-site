class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :podpis
      t.string :email
      t.text :wiadomosc
      t.string :nickname

      t.timestamps
    end
  end
end
