module DocumentsHelper


	VALID_IMAGE_TYPES = ["image/bmp", "image/gif", "image/jpeg", "image/png", "image/psd", "image/tiff"]
	VALID_PDF_TYPES = ["application/pdf", "application/x-pdf"]
	VALID_WORD_TYPES = ["application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "application/vnd.openxmlformats-officedocument.wordprocessingml.template"]
	VALID_EXCEL_TYPES = ["application/vnd.ms-excel", "application/vnd.ms-excel", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"]
	VALID_XML_TYPES = ["text/xml", "application/xml"]
	VALID_ZIP_TYPES = ["application/zip"]

	def icon_for_content_type(mime)
		if VALID_IMAGE_TYPES.include?(mime)
			return "file-img.png"
		elsif VALID_PDF_TYPES.include?(mime)
			return "file-pdf.png"
		elsif VALID_EXCEL_TYPES.include?(mime)
			return "file-xls.png"
		elsif VALID_WORD_TYPES.include?(mime)
			return "file-doc.png"
		elsif VALID_XML_TYPES.include?(mime)
			return "file-xml.png"
		elsif VALID_ZIP_TYPES.include?(mime)
			return "file-zip.png"
		else
			return "file-unknown.png"
		end
	end
end