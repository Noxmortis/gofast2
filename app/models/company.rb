class Company < ActiveRecord::Base
	include Searchable
  
  attr_accessible :city, :company_type, :contact_name, :email, :fax, :name, :postal_code, :primary_phone, :province, :secondary_phone, :street, :unit

  message = ValidationValues.message
  
  validates :city, :presence => true, :format => { :with => ValidationValues.city, :message => message }
  validates :company_type, :presence => true, :inclusion => { :in => ValidationValues.company_type }
  validates :contact_name, :format => { :with => ValidationValues.last_name, :message => message }, :allow_blank => true
  validates :email, :presence => true, :format => { :with => ValidationValues.email, :message => message }
  validates :fax, :numericality => true, :length => 10..11, :allow_blank => true
  validates :name, :presence => true, :format => { :with => ValidationValues.company, :message => message }
  validates :postal_code, :presence => true, :format => { :with => ValidationValues.postal_code, :message => message }
  validates :primary_phone, :presence => true, :numericality => true, :length => 10..11
  validates :province, :presence => true, :inclusion => { :in => ValidationValues.province }
  validates :secondary_phone, :numericality => true, :length => 10..11, :allow_blank => true 
  validates :street, :presence => true, :format => { :with => ValidationValues.street, :message => message }
  # validates :unit, :format => { :with => ValidationValues.unit, :message => message }, :allow_blank => true

  # comapny_type, name, email, primary_phone, contact_name => REQUIRED
  # unit, secondary_phone, fax => NOT REQUIRED
  # street, city, province, postal_code => ASK
end
