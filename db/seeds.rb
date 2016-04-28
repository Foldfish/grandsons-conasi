puts 'Creando roles'
["admin", "user"].each do |role|
    Role.create(name: role)
    puts 'Rol: ' << role
end

puts "Creando cuenta de Administrador"
first_user = User.create(email: ENV["ADMIN_EMAIL"].dup, password: ENV["ADMIN_PASSWORD"].dup, password_confirmation: ENV["ADMIN_PASSWORD"].dup)
puts "Usuario: " << first_user.email
first_user.add_role :admin

puts "Creando cuenta de Usuario"
second_user = User.create(email: ENV["USER_EMAIL"].dup, password: ENV["USER_PASSWORD"].dup, password_confirmation: ENV["USER_PASSWORD"].dup)
puts "Usuario: " << second_user.email
second_user.add_role :user

AttendanceRecord.create!([
  {start_of_week: "2016-04-25", monday_store_id: 4, tuesday_store_id: 4, wednesday_store_id: 2, thursday_store_id: 4, friday_store_id: 3, saturday_store_id: 4, sunday_store_id: 3, demo_staff_member_id: 3}
])
Chain.create!([
  {name: "Sistema"},
  {name: "Grupo Walton"},
  {name: "Grupo Carso"}
])
Customer.create!([
  {name: "ITESM CEM", contact: "Ariel Ortiz Ramírez", email: "aortiz@itesm.mx", phone: "5512369874"},
  {name: "Microsoft", contact: "John Smith", email: "j.smith@microsoft.com", phone: "1234678954"}
])
DemoStaffMember.create!([
  {name: "Víctor Colín Amador", phone: "5517027661", RFC: "COAV920612A8", CURP: "COAV920612HDFLMC07", NSS: "152350979156"},
  {name: "Carlos Alvarado Vargas", phone: "5512368452", RFC: "ALVC951307HJ8", CURP: "ALVC951307HDFGSD08", NSS: "451236875632"},
  {name: "Víctor Jara Jiménez", phone: "5517562314", RFC: "JAJV891205", CURP: "JAJV891205HDFLMC07", NSS: "651964035418"}
])
Store.create!([
  {store_key: "0000000", name: "Registro pendiente", address: "N/D", chain_id: 1},
  {store_key: "0000001", name: "Sin tienda (se usó suplente)", address: "N/D", chain_id: 1},
  {store_key: "1241245", name: "Walmart", address: "Lago Superior 127", chain_id: 2},
  {store_key: "2356787", name: "Telmex", address: "Montes Urales 15", chain_id: 3}
])
Supervisor.create!([
  {name: "Jorge Sánchez Fernández", phone: "5512638495", RFC: "SAFJ860412L9F", store_id: 3},
  {name: "Jimena Suárez Reyes", phone: "5513697845", RFC: "SURJ921209", store_id: 4}
])
