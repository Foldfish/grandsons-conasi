class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address

      t.belongs_to :chain, index: true

      t.timestamps null: false
    end
  end
end
