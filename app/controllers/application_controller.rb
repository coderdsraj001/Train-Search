class ApplicationController < ActionController::Base
	require 'time'
	require 'date'
	helper_method :custom_duration_to_hours_mn_sec_str, :range_of_current_to_two_hour_later, :admin?, :day_of_weak

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

	def current_day_of_week
		t = Time.at(Time.now)
		t.wday
	end

	def admin?
		current_user.admin?
	end

	def authorize_admin
    redirect_to root_path, alert: 'Access Denied' unless current_user.admin?
  end

  def day_of_weak(weak_number)
  	a = weak_number.to_i
  	w1 = Date::DAYNAMES[a]
  	w2 = w1[0, 3]
  	# day = ->num { Date::DAYNAMES[num] } 
  	# day.(a).length
		# Date::DAYNAMES[weak_number]
  end

end
