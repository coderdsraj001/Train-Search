class CreateTrainStations < ActiveRecord::Migration[6.0]
  def change
    create_table :train_stations do |t|
      t.integer :station_id
      t.integer :train_id
      
      t.timestamps
    end
  end
end
