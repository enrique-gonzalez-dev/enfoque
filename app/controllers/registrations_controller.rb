class RegistrationsController < Devise::RegistrationsController
	#before_action :authenticate_user_active

	def edit
		@user = current_user
		super
	end

	def update
		super
	end

	def update_info
		@user = current_user

		respond_to do |format|
	      if @user.update(update_info_params)
	        format.html { redirect_to @user.profile_path, notice: 'Su información ha sido actualizada correctamente.' }
	      else
	        format.html { render :edit }	        
	      end
	    end
	end

	protected

    def after_update_path_for(resource)
      resource.profile_path
    end

	private

	 def update_info_params
	   params.require(:user).permit(:first_name,:last_name,:surname, :phone)
	 end


end
