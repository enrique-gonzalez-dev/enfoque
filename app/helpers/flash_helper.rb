## Flash valid keys:
# flash[:error]
# flash[:danger]
# flash[:warning]
# flash[:notice]
# flash[:success]
# flash[:notification]

# Key is permitted to be a mix, keeping one of the main keys, separed by a '_' :
# flash[:success_login]

# any other will display an 'undefined' alert (black)

# Examples:
# flash[:error] = "Error in something"						=> Sends error alert
# flash[:error_my_model] = "Error in My Model"				=> Sends an error alert too
# flash[:danger_my_model_danger] = "Danger in something" 	=> Sends danger alert
# flash[:danger_my_model_danger] = "Danger in something" 	=> Sends danger alert
# flash[:name_error] = "Error in your name" 				=> Sends an undefined (black) alert


module FlashHelper

	def flash_type(fl)

		if fl.start_with?('error')
			return "error"

		elsif fl.start_with?('danger')
			return "danger"

		elsif fl.start_with?('notice')
			return "notice"

		elsif fl.start_with?('warning')
			return "warning"

		elsif fl.start_with?('success')
			return "success"

		elsif fl.start_with?('notif')
			return "notif"

		elsif fl.start_with?('chat')
			return "chat"

		else
			return "undefined"

		end

	end

end
