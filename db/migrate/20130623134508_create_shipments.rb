class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.integer :broker_id
      t.integer :driver_id
      t.integer :customer_id
      t.integer :trip_id
      t.integer :shipment_no
      t.datetime :pickup_time
      t.datetime :delivery_time
      t.decimal :rate
      t.integer :skid_count
      t.boolean :partial
      t.decimal :distance
      t.boolean :cartage

      t.timestamps
    end
  end
end
