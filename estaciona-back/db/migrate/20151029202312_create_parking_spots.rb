class CreateParkingSpots < ActiveRecord::Migration
  def change
    create_table :parking_spots do |t|
      t.float :coordX
      t.float :coordY
      t.integer :state
      t.float :time_out

      t.timestamps null: false
    end
  end
end
