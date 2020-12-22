class GsubFilter

	def GsubFilter.gsub_filter(string)
   		 st=string.gsub(/[^a-zA-Z0-9 \-\ñ\Ñ\á\Á\é\É\í\Í\ó\Ó\ú\Ú]/,"")
   		 return st
  	end

  	def GsubFilter.gsub_string(string)
  		nr = string.gsub('"', "'")
		return nr.gsub("\r\n", " ")
  	end
end