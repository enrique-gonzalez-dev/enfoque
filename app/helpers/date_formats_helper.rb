module DateFormatsHelper

	def secs_to_format(time)
		if time < 0
			return "0 minutos"
		end
			
		if time < 60
			return "menos de un minuto"	
		end

		hh = time.to_f / 3600.to_f
		hh = hh.floor
		cc = hh * 3600
		time = time - cc

		mm = time.to_f / 60.to_f
		mm = mm.floor

		mins = (mm == 1) ? "#{mm} minuto" : "#{mm} minutos"
		hours = ""
		if hh > 0
			hours = (hh == 1) ? "#{hh} hora" : "#{hh} horas"
			return "#{hours}, #{mins}"
		else
			return mins
		end
	end

	def secs_to_HM(time)
		if time < 0
			return "00:00"
		else
			parse_string = '%H:%M'
           Time.at(time).utc.strftime(parse_string)
         end 		
	end

	def secs_to_HMS(time)
		if time < 0
			return "00:00:00"
		else
			parse_string = '%H:%M:%S'
           Time.at(time).utc.strftime(parse_string)
         end 		
	end


	def time_to_format(utc)
		newtime = utc.localtime
		return newtime
	end

	def time_to_long_format(utc)
		if utc.nil?
			return "--"
		else
			return (l(utc, format: "%A, %e de %B de %Y a las %H:%M")).capitalize
		end
	end

	def time_to_mid_format(utc)
		if utc.nil?
			return "--"
		else
			return (l(utc, format: "%e de %B de %Y, %H:%M")).capitalize
		end
	end

	def time_to_notif_format(utc)
		newtime = utc.localtime
		return l(newtime, format: "%e de %B de %Y a las %H:%M")
	end

	def time_to_short_format(utc)
		if utc.nil? || utc == "" || utc == " " || utc == "-"
			return "--"
		else
			return l(utc, format: "%d/%m/%Y, %H:%M")
		end
	end

	def time_to_only_time_format(utc)
		if utc.nil? || utc == "" || utc == " " || utc == "-"
			return "--"
		else
			return l(utc, format: "%H:%M")
		end
	end

	def date_to_birth_format(time)
		if date_is_parsable?(time.to_s)
			return l(time, format: "%e de %B de %Y ")
		else
			return time.to_s
		end
	end

	def date_to_slash_format(time)
		if date_is_parsable?(time.to_s)
			return l(time, format: "%e / %b / %Y ").titleize
		else
			return time.to_s
		end
	end

	def date_to_picker_format(date)
		if !date.nil?
			return l(date, format: "%d/%m/%Y ")
		else
			return date
		end
	end

	def simple_date_format(t)
		newtime = t.localtime
		return newtime.strftime("%d/%m/%Y")
	end

	def simple_survey_date_format(t)
		return t.strftime("%d/%m/%Y")
	end

	def simple_long_date_format(t)
		if date_is_parsable?(t.to_s)
			return l(t, format: "%e de %B de %Y")		
		else
			return "--"
		end
	end

	def time_to_slash_format(utc)
		return l(utc, format: "%e / %b / %Y, %H:%M").titleize
	end

	def safe_time_to_slash_format(utc)
		if date_is_parsable?(utc.to_s)
			return l(utc, format: "%e / %b / %Y, %H:%M").titleize
		else
			return "--"
		end
	end

	def safe_date_to_slash_format(date)
		if date_is_parsable?(date.to_s)
			return l(date, format: "%e / %b / %Y ").titleize
		else
			return "--"
		end
	end

	def date_is_parsable?(string)
		begin
			Date.parse(string)
			true
		rescue ArgumentError
			false
		end
	end
	
end
