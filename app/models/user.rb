class User < ApplicationRecord

  	devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable

    belongs_to :meta, polymorphic: true, inverse_of: :user

    validates :first_name, presence:  { :message => "El campo Nombre(s) no puede estar vacío" }, length:{minimum:3,maximum:100,:message => "El nombre debe contener al menos 2 caracteres y máximo 100"} 
    validates :last_name, presence: { :message => "El campo Apellido Paterno no puede estar vacío" }, length:{minimum:3,maximum:100,:message => "El apellido paterno debe contener al menos 2 caracteres y máximo 100"} 
    validates :surname, presence: { :message => "El campo Apellido Materno no puede estar vacío" } , length:{minimum:3,maximum:100,:message => "El apellido materno debe contener al menos 3 caracteres y máximo 100"} 
    
    scope :email_search_query, lambda { |query|
    return nil  if query.blank?
    terms = query.to_s.downcase.split(/\s+/)
    terms = terms.map { |e| ('%' + e.gsub('*', '%') + '%').gsub(/%+/, '%')}
    num_or_conds = 1
    where(
      terms.map { |term|
        "(LOWER(email) LIKE ?)"
        }.join(' AND '),
        *terms.map { |e| [e] * num_or_conds }.flatten
        )
    }


    def User.users_for_search(term)
      dt = User.unaccent(term)
      users = []
      User.all.each do |us|
        if us.searchable_name.include?(dt)
          users << us
        end
      end
      return users
    end

  # = = = DEVISE CUSTOMIZATIONS = = = #
    def login=(login)
      @login = login
    end

    def login
      @login || self.email# || self.usercode
    end


=begin
    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(usercode) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:email) || conditions.has_key?(:usercode)
        conditions[:email].downcase! if conditions[:email]
        where(conditions.to_h).first
      end
    end
=end

    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:email)
        conditions[:email].downcase! if conditions[:email]
        where(conditions.to_h).first
      end
    end
  # = = = END DEVISE CUSTOMIZATIONS = = = #

    def searchable_name
      f = "#{self.first_name}#{self.last_name}#{self.surname}"
      t = User.unaccent(f)
      return t
    end

    def User.unaccent(term)
      f = term.gsub(' ', '')
      f = f.downcase
      f = f.gsub('á', 'a')
      f = f.gsub('é', 'e')
      f = f.gsub('í', 'i')
      f = f.gsub('ó', 'o')
      f = f.gsub('ú', 'u')
      return f
    end

  	def short_fullname
      if self.meta_type == "Institution"
        return "#{self.first_name}"
      else
        return "#{self.first_name} #{self.last_name}"
      end
  	end

    def folio
      return "C#{self.meta_id.to_s.rjust(4, '0')}"
    end

  	def fullname
    	return "#{self.first_name} #{self.last_name} #{self.surname}"
  	end

    def fullname_email
      return "#{self.first_name} #{self.last_name} #{self.surname} (#{self.email})"
    end    

    def not_auth
      "Email o contraseña no válidos"
    end

    def check_for_status
      if self.is_active
        return "checked"
      else
        return ""
      end
    end

    def dashboard_path
      if self.meta.nil?
        return "/"
      else
        self.meta.dashboard_path
      end
    end

    def profile_path
      if self.meta.nil?
        return "/"
      else
        self.meta.profile_path
      end
    end

    def edit_profile_path
      if self.meta.nil?
        return "/"
      else
        self.meta.edit_profile_path
      end
    end


end
