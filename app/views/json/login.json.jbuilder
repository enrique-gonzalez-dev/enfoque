json.partial! "json/rdata"
json.data do
	json.extract! @m_user, :id,:first_name, :last_name, :surname,:gender,:phone,:institution,:position,:email,:meta_type,:meta_id,:is_active
	json.auth_token @auth_token
end
