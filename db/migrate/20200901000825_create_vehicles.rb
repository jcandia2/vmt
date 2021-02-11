class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :vin
      t.string :year
      t.string :make
      t.string :model
      t.decimal :miles
      t.string :color
      t.string :user_id

      t.timestamps
    end
  end
end
