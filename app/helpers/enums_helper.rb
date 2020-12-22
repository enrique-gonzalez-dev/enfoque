module EnumsHelper

	def income_status_str(st)
		case st
		when "PendienteDePago"
			return "Pendiente de Pago"
		when "EnEsperaValidacion"
			return "En Espera de Validación"
		when "Rechazado"	
			return "Rechazado"
		when "Pagado"
			return st
		else
			return st.titleize
		end
	end


	def income_origin_str(st)
		case st
		when "Factura"
			return "Pago de Factura"
		when "Custodia"
			return "Depósito en Custodia"
		when "General"
			return "Ingreso General"
		else
			return st
		end
	end

	def outcome_kind_str(st)
		case st
		when "GastoRecurrente"
			return "Gasto recurrente"
		when "Nomina"
			return "Nómina"
		when "GastoOperacion"
			return "Gastos de operación (extraordinarios)"
		when "PagoDePendiente"
			return "Pago de Pendiente"
		else
			return st
		end
	end

	def outcome_status_str(st)
		case st
		when "PendienteDePago"
			return "Por Pagar"
		when "EnEsperaValidacion"
			return "En Espera de Validación"
		when "Rechazado"	
			return "Rechazado"
		when "Pagado"
			return st
		else
			return st.titleize
		end
	end

	def outcome_delivery_str(st)
		if st == true
			return "Entregada"
		else
			return "Pendiente de entrega"
		end
	end


	def invoice_status_str(st)
		case st
		when "PendienteDeValidacion"
			return "Pendiente de Validación"
		when "EnEsperaValidacionPago"
			return "En Espera de Validación del Pago"
		when "PagoValidado"	
			return "Pago Validado"
		when "Generada"	
			return "Enviada"
		else
			return st.titleize
		end
	end

	def invoice_way_to_pay_str(st)
		case st
		when "EnUnaSolaExhibicion"
			return "En una sola exhibición"
		when "EnParcialidades"
			return "En parcialidades"
		else
			return st
		end
	end

	def employee_role_str(st)
		case st
		when "NoDefinido"
			return "No definido"
		when "Juridico"
			return "Jurídico"
		when "Facturacion"	
			return "Facturación"
		when "Bancos"
			return "Bancos"
		else
			return st
		end
	end


end