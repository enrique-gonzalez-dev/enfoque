module UsersHelper
	def check_for_user_status(user)
		if user.disabled
			return ""
		else
			return "checked=\"checked\""
		end
	end

	def profile_path(user)
		if current_user
      		case current_user.meta_type 
      			when "Admin"
        			admin_profile_path
      			when "Participant"
        			participant_profile_path
      		end
    	end
	end
end