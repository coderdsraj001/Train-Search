class ApplicationController < ActionController::Base
	require 'time'

	helper_method :custom_duration_to_hours_mn_sec_str, :range_of_current_to_two_hour_later, :admin?

	def custom_duration_to_hours_mn_sec_str(duration)
	  hr, min = duration.divmod(60)
	  total_in_minutes = hr.hours + min.minutes 
	  Time.at(total_in_minutes).utc.strftime("%H:%M")
	end
	
	def range_of_current_to_two_hour_later
		time = Time.new
		current_time = (time.hour)*60 + time.min
		two_hour_after_current = current_time + (2*60)
		a = (current_time..two_hour_after_current).to_a
	end

	def admin?
		current_user.admin?
	end

	def authorize_admin
    redirect_to root_path, alert: 'Access Denied' unless current_user.admin?
  end

end
