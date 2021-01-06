class UserMailer < ApplicationMailer 
	def test_email
      mail(to: "team.vesparum@gmail.com", subject: 'Correo de Prueba').deliver
    end

  def applicant_accepted(applicant, msg)
    @applicant = applicant
    mail(to: "#{@applicant.email}", subject: 'Documentación aceptada - ' + msg,).deliver
  end
  def applicant_rejected(applicant, msg)
    @applicant = applicant
    mail(to: "#{@applicant.email}", subject: 'Documentación rechazada - ' + msg,).deliver
  end
  def business_accepted(business, msg)
    @business = business
    mail(to: "#{@business.email}", subject: 'Documentación aceptada - ' + msg,).deliver
  end
  def business_rejected(business, msg)
    @business = business
    mail(to: "#{@business.email}", subject: 'Documentación rechazada - ' + msg,).deliver
  end
end