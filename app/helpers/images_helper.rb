module ImagesHelper
	VALID_IMAGE_TYPES = ["image/jpeg", "image/png"]

	def image_type_validation(mime)
		return VALID_IMAGE_TYPES.include?(mime)
	end
end