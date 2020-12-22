class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  

  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json'}

  layout :resolve_layout
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_notification

  #### VALIDATIONS ####
  def unauthenticate_user
    redirect_to root_path unless current_user.nil?
  end

  def permission_for_access_level_1
    redirect_to root_path unless current_user.meta.access_level <= 1
  end

  def permission_for_access_level_3
    redirect_to root_path unless current_user.meta.access_level <= 3
  end

  def permission_for_access_level_5
    redirect_to root_path unless current_user.meta.access_level <= 5
  end

  def permission_for_access_level_7
    redirect_to root_path unless current_user.meta.access_level <= 7
  end

  def permission_for_access_level_10
    redirect_to root_path unless current_user.meta.access_level <= 10
  end


  def permission_for_access_specific_level_1
    redirect_to root_path unless current_user.meta.access_level == 1
  end

  def permission_for_access_specific_level_3
    redirect_to root_path unless current_user.meta.access_level == 3
  end

  def permission_for_access_specific_level_5
    redirect_to root_path unless current_user.meta.access_level == 5
  end

  def permission_for_access_specific_level_6
    redirect_to root_path unless current_user.meta.access_level == 6
  end

  def permission_for_access_specific_level_7
    redirect_to root_path unless current_user.meta.access_level == 7
  end

  def permission_for_access_specific_level_10
    redirect_to root_path unless current_user.meta.access_level == 10
  end

  def permission_for_access_super_user
    redirect_to root_path unless current_user.super_user == true
  end

  
  def authenticate_user_active
    authenticate_user!
    if !current_user.is_active
      flash[:error] = "Ya no tienes accesos a esta función. Por favor contacta a los administradores "
      sign_out current_user
      redirect_to "/"      
    end
  end

  def custom_authenticate_user_app
    @user = get_user_from_email
    if !@user.is_active
      @res = Rdata.new(false,"Se han revocado los permisos para hacer uso de esta funcion y por lo tanto la sesion de este dispositivo será finalizada, contacta con los administradores",999)
      render 'json/res.json'
    end
  end


  def validate_not_logged_id
    redirect_to root_path unless current_user == nil
  end

  def is_user_logged_in
    redirect_to root_path unless current_user == nil
  end

  def redirect_block
    redirect_to root_path
  end

  #### END VALIDATIONS ###
  
  #### API FUNCTIONS ###  

  def get_user_from_email
    m_user_email = request.headers["X-API-EMAIL"].presence
    user_email = ""

    if m_user_email
      user_email = ApiLayer.decode(m_user_email)
    end

    @res = Rdata.new

    if !user_email.blank?
      @user = User.find_by_email(user_email)
      if @user.nil?
        @res.set(false, 'Ha ocurrido un error con la petición', 404)
        #render :json => { :error => 'Not user found' }
        render 'json/res.json'
      else
       return @user
      end
    else
       @res.set(false, 'Ha ocurrido un error con la petición', 404)
      #render :json => { :error => 'Not data found' }
       render 'json/res.json'
    end
  end

  def authenticate_user_from_token!

      #  puts "**** HEADERS: ****"
      #  request.headers.each do |h,k|
      #    puts "#{h} => #{k}"
      #  end

        m_user_email = request.headers["X-API-EMAIL"].presence
        m_user_auth_token = request.headers["X-API-TOKEN"].presence
        user_email = ""
        user_auth_token = ""

        if m_user_email
          user_email = ApiLayer.decode(m_user_email)
        end

        if m_user_auth_token
          user_auth_token = ApiLayer.decode(m_user_auth_token)
        end

        user = user_email && User.find_by_email(user_email)


       # puts "USER_EMAIL => #{user_email}"
       # puts "USER_TOKEN => #{user_auth_token}"

        # Notice how we use Devise.secure_compare to compare the token
        # in the database with the token given in the params, mitigating
        # timing attacks.
        if user && Devise.secure_compare(user.auth_token, user_auth_token)
          sign_in(user, store: false)
        else
          @res = Rdata.new(false, 'No se encontraron datos de usuario');
          render 'json/res.json'
          #render :json => { :error => 'Invalid credentials' }
        end
    end

  #### END API FUNCTIONS ###  


  protected

  def default_regs_order
    return "desc"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:first_name,:last_name,:surname, :username, :email, :password, :password_confirmation, :avatar, :job_title,:extension,:disabled])
    devise_parameter_sanitizer.permit(:account_update, keys:[:first_name,:last_name,:surname, :username, :email, :password, :password_confirmation, :current_password, :avatar, :job_title,:extension,:disabled]) 
  end

  def check_notification
    if !params[:nid].nil?
      @notification =  Notification.find(params[:nid])
      if !@notification.nil?
        @notification.update_column(:read, true)
      end
    end
  end

  def not_found
    # raise ActionController::RoutingError.new('Not Found')
    raise ActiveRecord::RecordNotFound.new('No encontrado')
  end

  def profile_path_for_user(user)
    if user
      return user.profile_path
    else
      return "/"
    end
  end


  private

  def resolve_layout
    if current_user
      "system_layout"
    else
      "home_layout"
    end
  end

end
