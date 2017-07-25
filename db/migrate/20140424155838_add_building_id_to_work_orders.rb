class AddBuildingIdToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :building_id, :integer
  end
end
