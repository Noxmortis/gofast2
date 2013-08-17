class Shipment < ActiveRecord::Base
  attr_accessible :broker_id, :customer_id, :distance, :partial, :rate, :shipment_no, :trip_id

  message = ValidationValues.message

  validates :broker_id, :customer_id, :distance, :partial, :rate, :shipment_no, :trip_id, :presence => true
  validates :broker_id, :customer_id, :shipment_no, :trip_id, :partial, :numericality => true
  validates :rate, :distance, :format => { :with => ValidationValues.double, :message => message }
end
