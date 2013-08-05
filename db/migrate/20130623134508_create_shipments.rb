class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.integer :broker_id
      t.integer :customer_id
      t.integer :trip_id
      t.decimal :rate
      t.boolean :partial
      t.decimal :distance

      t.timestamps
    end
  end
end
