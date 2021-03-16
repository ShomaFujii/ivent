class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|

      t.text  :address,              null: false
      t.float  :latitude
      t.float  :longitude
      t.string  :station,      null: false
      t.text    :discribe,          null: false
      t.integer :price,       null: false
      t.string  :date,  null: false
      t.integer :pet_id,     null: false
      t.integer :air_conditioner_id,  null: false
      t.integer :toilet_id,             null: false
      t.integer :bathroom_id,  null: false
      t.integer :kitchen_id,             null: false
      t.integer :deposit,     null: false
      t.string :phone_number
      t.string  :mail
      t.references :user,           null: false, foreign_key: true
      
      
      t.timestamps
    end
  end
end
