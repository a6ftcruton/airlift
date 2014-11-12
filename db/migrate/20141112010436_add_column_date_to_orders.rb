class AddColumnDateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :pickup_date, :date
  end
end
