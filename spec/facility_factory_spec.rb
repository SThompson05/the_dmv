require './lib/facility'
require './lib/facility_factory'
require './lib/dmv_data_service'

RSpec.describe FacilityFactory do
    # it 'creates office from Colorado DMV office locations' do
    #     factory = FacilityFactory.new
    #     co_factory = DmvDataService.new.co_dmv_office_locations
    #     co_offices = factory.create_office(co_factory)

    #     expect(co_offices).to be_an(Array)
    #     expect(co_offices.first).to be_a(FacilityInfo)
       
    #     expect(co_offices.first.geom).to eq({:coordinates=>[-104.97443112500002, 39.75525297420336], :type=>"Point"})
    #     expect(co_offices.first.id).to eq('1')
    #     expect(co_offices.first.office).to eq('DMV Tremont Branch')
    #     expect(co_offices.first.address_1).to eq('2855 Tremont Place')
    #     expect(co_offices.first.address_2).to eq('Suite 118')
    #     expect(co_offices.first.city).to eq('Denver')
    #     expect(co_offices.first.state).to eq('CO')
    #     expect(co_offices.first.zip).to eq('80205')
    #     expect(co_offices.first.phone).to eq('(720) 865-4600')
    #     expect(co_offices.first.hours).to eq('Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.')
    #     expect(co_offices.first.services).to eq('vehicle titles, registration, renewals;  VIN inspections')
    #     expect(co_offices.first.parking).to eq('parking available in the lot at the back of the bldg (Glenarm Street)')
    #     expect(co_offices.first.photo).to eq('images/Tremont.jpg')
    #     expect(co_offices.first.address_id).to eq('175164')
    #     expect(co_offices.first.comp_region).to eq('1444')
    # end

    it 'creates office from New York DMV office locations' do
        factory = FacilityFactory.new
        ny_factory = DmvDataService.new.ny_dmv_office_locations
        ny_offices = factory.create_office(ny_factory)

        expect(ny_offices).to be_an(Array)
        expect(ny_offices.first).to be_a(FacilityInfo)
        
        expect(ny_offices.first.office).to eq('HUNTINGTON')
        expect(ny_offices.first.office_type).to eq('DISTRICT OFFICE')
        expect(ny_offices.first.phone).to eq('7184774820')
        expect(ny_offices.first.address_1).to eq('1815 E JERICHO TURNPIKE')
        expect(ny_offices.first.city).to eq('HUNTINGTON')
        expect(ny_offices.first.state).to eq('NY')
        expect(ny_offices.first.zip).to eq('11743')
        # expect(ny_offices.first.format_hours).to eq('Monday: 7:30 AM - 5:00 PM, Tuesday: 7:30 AM - 5:00 PM, Wednesday: 7:30 AM - 5:00 PM, Thursday: 7:30 AM - 5:00 PM, Friday: 7:30 AM - 5:00 PM')
        expect(ny_offices.first.geom).to eq({:type=>"Point", :coordinates=>[-73.336022661, 40.836000946]})
        expect(ny_offices.first.comp_region).to eq('1020')
        expect(ny_offices.first.comp_region_2).to eq('1120')
        expect(ny_offices.first.comp_region_3).to eq('2179')
        
    end

    it 'creates office from Missouri DMV office locations' do
        factory = FacilityFactory.new
        mo_factory = DmvDataService.new.mo_dmv_office_locations
        mo_offices = factory.create_office(mo_factory)

        expect(mo_offices).to be_an(Array)
        expect(mo_offices.first).to be_a(FacilityInfo)
        
        expect(mo_offices.first.region_num).to eq('5')
        # mapped number to id
        expect(mo_offices.first.id).to eq('059')
        # mapped type to office_type
        expect(mo_offices.first.office_type).to eq('1MV')
        expect(mo_offices.first.office).to eq('FERGUSON-OFFICE CLOSED UNTIL FURTHER NOTICE')
        expect(mo_offices.first.address_1).to eq('10425 WEST FLORISSANT')
        expect(mo_offices.first.city).to eq('FERGUSON')
        expect(mo_offices.first.state).to eq('MO')
        expect(mo_offices.first.zip).to eq('63136')
        # mapped located_in to parking
        expect(mo_offices.first.parking).to eq('Personalized plates can be picked up at the North County License Office. ')
        expect(mo_offices.first.county).to eq('St. Louis County')
        expect(mo_offices.first.phone).to eq('(314) 733-5316')
        expect(mo_offices.first.fax).to eq('(314) 733-5319')
        expect(mo_offices.first.size).to eq('3')
        expect(mo_offices.first.email).to eq('FERGUSONAGENTOFFICE@DOR.MO.GOV')
         # mapped latlng to geom
        expect(mo_offices.first.geom).to eq({:latitude=>"38.737935", :longitude=>"-90.220029"})
        expect(mo_offices.first.texting_num).to eq('(314) 730-0606')
        # mapped additional_license_office_info to services
        expect(mo_offices.first.services).to eq('Personalized plates can be picked up at the North County License office located at 11700 W Florissant, St. Louis, MO 63033.')
        expect(mo_offices.first.comp_region).to eq('203')
        expect(mo_offices.first.comp_region_2).to eq('51')
        expect(mo_offices.first.comp_region_3).to eq('2210')
   
    end
end

# NY DMV Info
# [{:office_name=>"HUNTINGTON",*********
#   :office_type=>"DISTRICT OFFICE",*******
#   :public_phone_number=>"7184774820",*******
#   :street_address_line_1=>"1815 E JERICHO TURNPIKE",*******
#   :city=>"HUNTINGTON",******
#   :state=>"NY",********
#   :zip_code=>"11743",******
#   :monday_beginning_hours=>"7:30 AM",
#   :monday_ending_hours=>"5:00 PM",
#   :tuesday_beginning_hours=>"7:30 AM",
#   :tuesday_ending_hours=>"5:00 PM",
#   :wednesday_beginning_hours=>"7:30 AM",
#   :wednesday_ending_hours=>"5:00 PM",
#   :thursday_beginning_hours=>"7:30 AM",
#   :thursday_ending_hours=>"5:00 PM",
#   :friday_beginning_hours=>"7:30 AM",
#   :friday_ending_hours=>"5:00 PM",
#   :georeference=>{:type=>"Point", :coordinates=>[-73.336022661, 40.836000946]},
#   :":@computed_region_yamh_8v7k"=>"1020", ********
#   :":@computed_region_wbg7_3whc"=>"1120",*********
#   :":@computed_region_kjdx_g34t"=>"2179"},*********

# MO DMV Info
# {:number=>"059",*******
#   :dorregionnumber=>"5",
#   :type=>"1MV",*****
#   :name=>"FERGUSON-OFFICE CLOSED UNTIL FURTHER NOTICE",******
#   :address1=>"10425 WEST FLORISSANT",*********
#   :city=>"FERGUSON",*********
#   :state=>"MO",*********
#   :zipcode=>"63136",********
#   :located_in=>"Personalized plates can be picked up at the North County License Office. ",
#   :county=>"St. Louis County",*******
#   :phone=>"(314) 733-5316",*********
#   :fax=>"(314) 733-5319",**********
#   :size=>"3", ******
#   :email=>"FERGUSONAGENTOFFICE@DOR.MO.GOV",*********
#   :latlng=>{:latitude=>"38.737935", :longitude=>"-90.220029"},******
#   :textingphonenumber=>"(314) 730-0606",*******
#   :additional_license_office_info=> ******
#    "Personalized plates can be picked up at the North County License office located at 11700 W Florissant, St. Louis, MO 63033.",
#   :":@computed_region_ny2h_ckbz"=>"203",*******
#   :":@computed_region_c8ar_jsdj"=>"51",******
#   :":@computed_region_ikxf_gfzr"=>"2210"},*******