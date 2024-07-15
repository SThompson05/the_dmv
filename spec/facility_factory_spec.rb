require './lib/facility'
require './lib/facility_factory'
require './lib/dmv_data_service'

RSpec.describe FacilityFactory do
    it 'creates office from Colorado DMV office locations' do
        factory = FacilityFactory.new
        co_factory = DmvDataService.new.co_dmv_office_locations
        co_offices = factory.create_office(co_factory)

        expect(co_offices).to be_an(Array)
        expect(co_offices.first).to be_a(Facility)
        
        expect(co_offices.first.name).to eq('DMV Tremont Branch')
        expect(co_offices.first.address).to eq('2855 Tremont Place')
        expect(co_offices.first.phone).to eq('(720) 865-4600')
        expect(co_offices.first.services).to eq('vehicle titles, registration, renewals;  VIN inspections')
    end

    it 'creates office from New Year DMV office locations' do
        factory = FacilityFactory.new
        ny_factory = DmvDataService.new.ny_dmv_office_locations
        ny_offices = factory.create_office(ny_factory)

        expect(ny_offices).to be_an(Array)
        expect(ny_offices.first).to be_a(Facility)
        
        expect(ny_offices.first.name).to eq('HUNTINGTON')
        expect(ny_offices.first.address).to eq('1815 E JERICHO TURNPIKE')
        expect(ny_offices.first.phone).to eq('7184774820')
        # New York doesn't list their services
    end
end