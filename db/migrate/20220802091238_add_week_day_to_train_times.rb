class AddWeekDayToTrainTimes < ActiveRecord::Migration[6.0]
  def change
    add_column :train_times, :week_day, :integer
  end
end
