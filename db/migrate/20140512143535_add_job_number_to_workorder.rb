class AddJobNumberToWorkorder < ActiveRecord::Migration
  def change
    add_column :work_orders, :job_number, :string
    add_column :work_orders, :invoice_number, :string
  end
end
