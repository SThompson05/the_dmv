class VehicleFactory
    
  def create_vehicles(data)
    data.map do |record|
      Vehicle.new(
        vin: record[:vin_1_10],
        year: record[:model_year],
        make: record[:make],
        model: record[:model],
        engine: :ev
      )
    end
  end
end
