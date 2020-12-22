puts "Seeding for first  admin"

mail = "developers.vesparum@gmail.com"
us = User.where(email: mail).first

if us.nil?
	ad = Admin.new 
	us = User.new 

	#us.username = "admin"
	us.first_name = "Webmaster"
	us.last_name = "Vespa"
	us.surname = "Techno"
	us.email = mail
	us.is_active = true
	us.super_user = true
	us.password = "password"
	us.confirmed_at = Time.now
	us.save
	#ad.save
	ad.user = us
	ad.save

	puts "Seeding for first admin successfully"
else
	puts "First super admin already exists"	
end
