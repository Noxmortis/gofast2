class Skid < ActiveRecord::Base
  attr_accessible :delivery_location, :delivery_time, :oversized, :pickup_location, :pickup_time, :product_desc, :shipment_id, :skid_count, :warehouse_delivery_time, :warehouse_pickup_time, :weight

  message = ValidationValues.message

  validates :delivery_location, :delivery_time, :oversized, :pickup_location, :pickup_time, :product_desc, :shipment_id, :skid_count, :warehouse_delivery_time, :warehouse_pickup_time, :weight, :presence => true
  validates :shipment_id, :skid_count, :numericality => true
  validates :delivery_location, :pickup_location, :format => { :with => ValidationValues.street, :message => message }
  validates :delivery_time, :pickup_time, :warehouse_delivery_time, :warehouse_pickup_time, :format => { :with => ValidationValues.date_time, :message => message }
  validates :weight, :format => { :with => ValidationValues.double, :message => message }
  validates :oversized, :inclusion => { :in => %w(true false) }
end
