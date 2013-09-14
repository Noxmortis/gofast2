class ValidationValues
  @double = /\d+\.?\d{0,2}/
  @alpha = /[A-Za-z]+/
  @alpha_numeric = /[A-Za-z0-9]+/
  @content = /[A-Za-z0-9,.;'!@#\$%^&*()_=+|]+/

  @first_name = /[A-Za-z ]+/
  @last_name = /[A-Za-z' ]+/
  @company = /[A-Za-z.\- ]+/
  @city = /[A-Za-z'. ]+/
  @street = /\d{0,4} ?[A-Za-z. ]+/
  @unit = /[A-Z0-9 ]+/
  @license_plate = /[A-Z0-9 ]+/
  @hst_no = /[A-Z0-9]+/
  @date = /\A\d{4}(-\d{2}){2}\Z/
  @date_time = /\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}\sUTC/
  @email = /[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}/
  @postal_code = /[A-Za-z][0-9][A-Za-z]\s[0-9][A-Za-z][0-9]/

  @province = %w(Alberta British\ Columbia Manitoba New\ Brunswick Newfoundland\ and\ Labrador Nova\ Scotia Ontario Prince\ Edward\ Island Quebec Saskatchewan Northwest\ Territories Nunavut Yukon)
  @vehicle_type = %w(truck trailer)
  @vehicle_sub_type = %w(regular straight tractor refrigerator)
  @company_type = %w(broker)

  @message = 'does not match expected format.';
  
  def self.double
    @double
  end

  def self.alpha
    @alpha
  end

  def self.alpha_numeric
    @alpha_numeric
  end
  
  def self.content
    @content
  end

  def self.first_name
    @first_name
  end

  def self.last_name
    @last_name
  end

  def self.company
    @company
  end

  def self.city
    @city
  end

  def self.street
    @street
  end

  def self.unit
    @unit
  end

  def self.license_plate
    @license_plate
  end

  def self.hst_no
    @hst_no
  end

  def self.date
    @date
  end

  def self.date_time
    @date_time
  end

  def self.email
    @email
  end
  
  def self.postal_code
    @postal_code
  end

  def self.province
    @province
  end

  def self.vehicle_type
    @vehicle_type
  end

  def self.vehicle_sub_type
    @vehicle_sub_type
  end
  
  def self.company_type
    @company_type
  end

  def self.message
    @message
  end
end
