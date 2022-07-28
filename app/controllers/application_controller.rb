class ApplicationController < ActionController::Base
	require 'time'

	helper_method :custom_duration_to_hours_mn_sec_str, :range_of_current_to_two_hour_later

	def custom_duration_to_hours_mn_sec_str(duration)
	  hr, min = duration.divmod(60)
	  total_in_minutes = hr.hours + min.minutes 
	  Time.at(total_in_minutes).utc.strftime("%H:%M")
	end

	def convert_hours_mm_sec_str_to_integer
		'12:34:56	'.split(':').map(&:to_i).inject(0) { |a, b| a * 60 + b }
	end
	
	def range_of_current_to_two_hour_later
		time = Time.new
		current_time = (time.hour)*60 + time.min
		two_hour_after_current = current_time + (2*60)
		a = (current_time..two_hour_after_current).to_a
	end

end
