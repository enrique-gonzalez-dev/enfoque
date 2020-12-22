# app/controllers/sessions_controller.rb
class SessionsController < Devise::SessionsController
# app/controllers/sessions_controller.rb
#skip_filter :verify_signed_out_user, only: :destroy

def create
  respond_to do |format|
    format.html do
      self.resource = warden.authenticate!(auth_options)
      yield resource if block_given?

      ### DESACTIVADO ACCESO PARA ESTUDIANTES - TEMPORALMENTE
      if self.resource.is_active == true and self.resource.meta_type != "Student"        
        flash[:success] = "Se ha iniciado sesión correctamente"
        sign_in(resource_name, resource)
        respond_with resource, location: after_sign_in_path_for(resource)       
      else
        flash[:undef] = resource.not_auth
        sign_out(resource_name)
        respond_with resource, location: request.referrer
      end
    end
  end     
end


def destroy
  signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
  yield if block_given?
  respond_to_on_destroy
end

#configure auto_session_timeout
def active
  render_session_status
end

def timeout
  if !current_user.nil?
    flash[:notice] = "Tu sesión ha expirado."
    redirect_to "/users/sign_in"
  else
    flash[:notice] = "Inicia sesión para continuar."
    redirect_to "/users/sign_in"
  end
end

private

def invalid_login_attempt
  warden.custom_failure!
  @res = Rdata.new(false, "El usuario o la contraseña son incorrectos.", 401)
  #@res.set(false, 'Error with your login or password')
  render 'json/res.json'
  #render json: { success: false, message: 'Error with your login or password' }, status: 401
end

def after_sign_in_path_for(resource)
  super
  #if resource.is_active
  #  sign_out resource
  #  flash.discard
  #  flash[:error] = "Esta cuenta ha sido dada de baja"
  #  root_path
  #else
  #  super
  #end
end

def resource_from_credentials
  user = params[:user]
  #puts "E_EMAIL => #{user[:email]}"
  nemail = user[:email]
  npass = user[:password]
puts "E_EMAIL => #{nemail}"

  data = { email: nemail}
  res = resource_class.find_for_database_authentication(data)
  if res
    meta = res.meta_type
    valid = res.valid_password?(npass)
    if valid
     return res
   end
 end
end



end
