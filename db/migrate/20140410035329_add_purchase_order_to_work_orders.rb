class AddPurchaseOrderToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :purchase_order, :string
    add_column :work_orders, :instructions, :string
    add_column :work_orders, :building, :string
    add_column :work_orders, :contact, :string
    add_column :work_orders, :technical_notes, :string
  end
end
