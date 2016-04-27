class CreateCustomersStores < ActiveRecord::Migration
  def change
    create_table :customers_stores, id: false do |t|
    	t.belongs_to :customer, index: true
    	t.belongs_to :store, index: true
    end
  end
end
