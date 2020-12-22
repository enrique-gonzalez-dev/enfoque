class AccessLevelModel < ActiveRecord::Base
  self.abstract_class = true


  # ACCESS LEVELS:
  # 1. Admin
  # 5. Participant


  def access_level
  	return 0
  end

  def role_name
  	return "--"
  end

  def dashboard_path
    return "/"
  end
end
