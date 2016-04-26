json.array!(@demo_staff_members) do |demo_staff_member|
  json.extract! demo_staff_member, :id, :name, :phone, :RFC, :CURP, :NSS
  json.url demo_staff_member_url(demo_staff_member, format: :json)
end
