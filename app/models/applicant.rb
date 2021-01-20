class Applicant < ApplicationRecord
    enum school_grade: [:Primaria, :Secundaria, :Preparatoria, :Universidad]
    has_one_attached :cedule_id
    has_one_attached :address_proof
    has_one_attached :ine_id

    has_one :state
    has_one :city

    validates :name, presence: true
    validates :name, length: { minimum: 10, message: "El nombre es demasiado corto" }
    validates :phone, presence: true
    validates :phone, numericality: { message: "El teléfono solo debe incluir numeros"}
    validates :phone, length: { minimum: 10, message: "El teléfono debe incluir 10 digitos" }
    validates :email, presence: true
    validates :protest, acceptance: { message: 'Debes declarar que NO estudias y NO trabajas, con el fin de poder ser candidato para el programa de Jóvenes Construyendo el Futuro.' }
end
