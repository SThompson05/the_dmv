require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  it 'creates vehicles from the WA EV registrations data' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    vehicles = factory.create_vehicles(wa_ev_registrations)

    expect(vehicles).to be_an(Array)
    expect(vehicles.first).to be_a(Vehicle)
    expect(vehicles.first.engine).to eq(:ev)
    # below is subjected to change bc of live data
    expect(vehicles.first.vin).to eq('3C3CFFGE5F') 
  end

end
