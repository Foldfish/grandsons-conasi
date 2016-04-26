class CreateSupervisors < ActiveRecord::Migration
  def change
    create_table :supervisors do |t|
      t.string :name
      t.string :phone
      t.string :RFC

      t.belongs_to :store, index: true

      t.timestamps null: false
    end
  end
end
