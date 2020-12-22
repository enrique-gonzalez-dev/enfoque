class UserMailer < ApplicationMailer 
	def test_email
      mail(to: "team.vesparum@gmail.com", subject: 'Correo de Prueba').deliver
    end
end