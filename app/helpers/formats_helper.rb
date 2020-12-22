module FormatsHelper

	def payment_method_to_text(mm)
		case mm
		when "Card"
			return "Tarjeta Crédito/Débito"
		when "Cash"
			return "Efectivo"
		end
	end

	def num_plus_one(num)
		return num +1
	end

	def human_boolean(boolean)
    	boolean ? 'Si' : 'No'
	end

	def gsub_string(str)
		nr = str.gsub('"', "'")
		return nr.gsub("\r\n", " ")
	end

	def truncated_desc(desc)
		return desc.truncate(30)
	end

	def nts(str)
		if str.nil? || str.blank?
			return "--"
		else
			return str
		end
	end

	def ynf(val)
		if val.nil?
			return "--"
		else
			if val == true || val == "Y" || val == 1
				return "Sí"
			else
				return "No"
			end
		end
	end

	def ntf(val)
		if val.nil? || val == 0 || val.blank?
			return "--"
		else
			return val
		end
	end

	def ttsf(time)
		return time_to_short_format(time)		
	end

	def stf(secs)
		if secs.nil?
			return "--"
		else
			return secs_to_format(secs)
		end
	end

	def ctmf(cents)
		return cents_to_money_format(cents)
	end

	def cents_to_money_format(cents)
		return ( Money.new (cents) ).format
	end
end