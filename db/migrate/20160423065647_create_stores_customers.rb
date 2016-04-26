class CreateStoresCustomers < ActiveRecord::Migration
  def change
    create_table :stores_customers, id: false do |t|
    	t.belongs_to :store, index: true
    	t.belongs_to :customer, index: true
    end
  end
end
