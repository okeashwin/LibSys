# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#The preconfigured admin

 # User.create(name: 'superUser', email: 'superUser@libsys.com', password: 'Password12', isDeleted: FALSE,
 #             role: User::IS_ADMIN)

(1...5).each do |i|
name = 'member'+i.to_s
email = 'member'+i.to_s+'@gmail.com'
password = 'member'+i.to_s+'pwd'
User.create(name: name, email: email, password: password, isDeleted: FALSE,
            role: User::IS_MEMBER)
end