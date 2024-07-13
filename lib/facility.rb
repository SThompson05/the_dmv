class Facility
  attr_reader :name, :address, :phone, 
              :services, :registered_vehicles, :collected_fees

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    return unless @services.include?('Vehicle Registration')
    return unless vehicle.is_a?(Vehicle)

    update_plate_type_and_fees(vehicle)
    set_registration_date(vehicle)
    @registered_vehicles << vehicle
  end

  def administer_written_test(registrant)
    return false unless @services.include?('Written Test')
    return false unless registrant.permit?
  
    registrant.license_data[:written] = true
    true
  end
  

  private

  def update_plate_type_and_fees(vehicle)
    if vehicle.antique?
      vehicle.plate_type = :antique
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      vehicle.plate_type = :ev
      @collected_fees += 200
    else
      vehicle.plate_type = :regular
      @collected_fees +=100
    end
  end

  def set_registration_date(vehicle)
    vehicle.registration_date = Date.today
  end


end
