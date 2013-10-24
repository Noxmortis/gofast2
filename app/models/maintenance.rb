class Maintenance < ActiveRecord::Base
	include Searchable
  
  attr_accessible :vehicle_type, :cost, :date, :description, :kilometres, :trip_id, :maintenance_type, :vehicle_id

  message = ValidationValues.message

  validates :vehicle_type, :cost, :date, :description, :kilometres, :trip_id, :maintenance_type, :vehicle_id, :presence => true
  validates :trip_id, :vehicle_id, :numericality => true
  validates :cost, :format => { :with => ValidationValues.double, :message => message }
  validates :kilometres, :format => { :with => ValidationValues.integer, :message => message }
  validates :date, :format => { :with => ValidationValues.date, :message => message }
  validates :maintenance_type, :inclusion => { :in => ValidationValues.maintenance_type }
  validates :vehicle_type, :inclusion => { :in => ValidationValues.vehicle_type }
  validates :description, :format => { :with => ValidationValues.content, :message => message }
end
