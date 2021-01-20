class Business < ApplicationRecord
    enum kind: [:fisica, :moral]
    enum minimum_grade: [:Primaria, :Secundaria, :Prepa, :Universidad]
    enum agent_position: [:Propietario, :Gerente, :Empleado]

    has_one :state
    has_one :city
    has_many :business_reports

    has_one_attached :taxes_id
    has_one_attached :internal_img
    has_one_attached :external_img
    has_one_attached :proof_residency

    has_one_attached :notarial_document
    has_one_attached :official_id
    has_one_attached :official_back_id
    has_one_attached :agent_proof
    has_one_attached :agent_selfie
    
    has_one_attached :feedback_1
    has_one_attached :feedback_2
    has_one_attached :feedback_3
    has_one_attached :training_plan
    
    has_one_attached :agreement
    has_one_attached :advance_payment
    has_one_attached :verified_business
    has_one_attached :settlement_payment


    validates :name, presence: true
    validates :name, length: { minimum: 4, message: "El nombre es demasiado corto" }
    validates :phone, presence: true
    validates :phone, numericality: { message: "El teléfono solo debe incluir numeros"}
    validates :phone, length: { minimum: 10, message: "El teléfono debe incluir 10 digitos" }
    validates :email, presence: true

    def kind_str
        case self.kind
        when 0
            return "Persona Física"
        when 1
            return "Persona Moral"
        else
            return "Invalid"
        end
    end 

end
