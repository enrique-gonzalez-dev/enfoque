class PagesController < ApplicationController

	def home
    if user_signed_in? 
        redirect_to current_user.dashboard_path      
    end
  end
  def public_registry
  end

	def create
		respond_to do |format|
	      if true
	        format.html { redirect_to "/", notice: 'Ejemplo de notificación de éxito con texto' }
	      else
	        format.html { render "home", error: "jeje" }
	      end
	    end
	end
end
