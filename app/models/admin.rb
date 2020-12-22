class Admin < AccessLevelModel
	has_one :user, as: :meta, inverse_of: :meta, dependent: :destroy
	accepts_nested_attributes_for :user

    scope :all_except, ->(user) { where.not(id: user) }

	def access_level
		return 1
	end

	def role_name
		return "Administrador General"
	end

	def dashboard_path
		return "/admin_dashboard"      
	end

	def profile_path
		return "/admin_profile"      
	end
end
