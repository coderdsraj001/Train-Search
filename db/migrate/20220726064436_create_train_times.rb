class CreateTrainTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :train_times do |t|
      t.integer :station_id
      t.integer :train_id
      t.integer :arrival
      t.integer :departure

      t.timestamps
    end
  end
end
