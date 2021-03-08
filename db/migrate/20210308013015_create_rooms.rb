class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|

      t.string  :address,              null: false
      t.string  :station,      null: false
      t.text    :discribe,          null: false
      t.integer :price,       null: false
      t.integer :date,  null: false
      t.integer :pet_id,     null: false
      t.integer :air_conditioner_id,  null: false
      t.integer :toilet_id,             null: false
      t.integer :bathroom_id,  null: false
      t.integer :kichen_id,             null: false
      t.integer :deposit,     null: false
      t.integer :phone_number,     null: false
      t.string  :mail,     null: false
      t.references :user,           null: false, foreign_key: true
      

      t.timestamps
    end
  end
end
