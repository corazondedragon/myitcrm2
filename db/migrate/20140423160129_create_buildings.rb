class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.integer :id
      t.string :name
      t.integer :user_id
      t.string :address
      t.string :description

      t.timestamps
    end
  end
end
