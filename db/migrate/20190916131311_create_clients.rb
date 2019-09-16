class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :firstname, limit: 50, null: false
      t.string :lastname, limit: 50, null: false
      t.string :phone, limit: 24, null: false
      t.string :email, limit: 30, null: false

      t.timestamps
    end
  end
end
