class CreateDemoStaffMembers < ActiveRecord::Migration
  def change
    create_table :demo_staff_members do |t|
      t.string :name
      t.string :phone
      t.string :RFC
      t.string :CURP
      t.string :NSS

      t.timestamps null: false
    end
  end
end
