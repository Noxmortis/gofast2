# This file allows access to the database through the Truck object.
# attr_accessible defines the attributes that are allowed to be used by creating accessor and mutator methods.
# This file also validates the data before it is submitted to the database.
# The values for validation are stored in /lib/validation_values.rb
class Truck < ActiveRecord::Base
  include Searchable
  # get/set method
  attr_accessible :license_expires, :license_plate, :make, :manufactured_year, :model, :owner, :total_kilometres, :truck_no, :truck_type, :vin, :current_location, :photo, :color
  
  # tells database there is a file associated with this field
  has_attached_file :photo, :default_url => 'missing.png'

  message = ValidationValues.message
  
  # validation for all fields
  validates :make, :manufactured_year, :model, :owner, :total_kilometres, :truck_type, :vin, :current_location, :color, :presence => true
  validates :manufactured_year, :owner, :numericality => true
  validates :manufactured_year, :length => 4..4
  validates :truck_no, :numericality => true, :allow_blank => true
  validates :color, :format => { :with => ValidationValues.alpha_numeric, :message => message  }
  validates :license_expires, :format => { :with => ValidationValues.date, :message => message }, :allow_blank => true
  validates :total_kilometres, :format => { :with => ValidationValues.integer, :message => message }
  validates :make, :model, :format => { :with => ValidationValues.alpha_numeric, :message => message }
  validates :vin, :format => { :with => ValidationValues.vin, :message => message }, :length => 17..17, :uniqueness => true
  validates :current_location, :format => { :with => ValidationValues.street, :message => message }
  validates :license_plate, :format => { :with => ValidationValues.license_plate, :message => message }, :length => 3..8, :allow_blank => true, :uniqueness => true
  validates :truck_type, :inclusion => { :in => ValidationValues.truck_type }
  validates :truck_no, :uniqueness => true, :allow_blank => true
  validates_attachment_size :photo, :less_than => 1.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
end
