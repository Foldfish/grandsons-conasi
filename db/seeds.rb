# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Creando roles'
["admin", "user"].each do |role|
    Role.create(name: role)
    puts 'Rol: ' << role
end

puts "Creando cuenta de Administrador"
first_user = User.create(email: ENV["ADMIN_EMAIL"].dup, password: ENV["ADMIN_PASSWORD"].dup, password_confirmation: ENV["ADMIN_PASSWORD"].dup)
puts "Usuario: " << first_user.email
first_user.add_role :admin