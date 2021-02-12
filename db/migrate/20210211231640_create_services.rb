class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name
      t.datetime :date_of_service
      t.decimal :miles
      t.string :warranty_length
      t.string :location
      t.decimal :cost
      t.string :notes
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
