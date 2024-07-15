class FacilityInfo
    attr_reader :geom, :id, :office, :address_1, :address_2,
                :city, :state, :zip, :phone, :hours, :services,
                :parking, :photo, :address_id, :comp_region, 
                :comp_region_2, :comp_region_3, :county, 
                :office_type
    def initialize(details)
        @geom = details[:geom]
        @id = details[:id]
        @office = details[:office]
        @address_1 = details[:address_1]
        @address_2 = details[:address_2]
        @city = details[:city]
        @state = details[:state]
        @zip = details[:zip]
        @phone = details[:phone]
        @hours = details[:hours]
        @services = details[:services]
        @parking = details[:parking]
        @photo = details[:photo]
        @address_id = details[:address_id]
        @comp_region = details[:comp_region]
        @comp_region_2 = details[:comp_region_2]
        @comp_region_3 = details[:comp_region_3]
        @office_type = details[:office_type]
        @county = details[:county]
    end
end

class FacilityFactory
        def create_office(info)
            info.map do |office_info|
                FacilityInfo.new({
                geom: office_info[:the_geom] || office_info[:georeference],
                id: office_info[:dmv_id],
                office: office_info[:dmv_office] || office_info[:office_name],
                address_1: office_info[:address_li] || office_info[:street_address_line_1],
                address_2: office_info[:address__1],
                city: office_info[:city],
                state: office_info[:state],
                zip: office_info[:zip] || office_info[:zip_code],
                phone: office_info[:phone] || office_info[:public_phone_number],
                hours: office_info[:hours],
                services: office_info[:services_p],
                parking: office_info[:parking_no],
                photo: office_info[:photo],
                address_id: office_info[:address_id],
                comp_region: office_info[:":@computed_region_nku6_53ud"] || office_info[:":@computed_region_yamh_8v7k"],
                comp_region_2: office_info[:":@computed_region_wbg7_3whc"],
                comp_region_3: office_info[:":@computed_region_kjdx_g34t"],
                office_type: office_info[:office_type],
                county: office_info[:county]
                })
                # office_type: office_info[:office_type]
            end
        end
    end

# class FacilityFactory

#     def create_office(info)
#         info.map do |office_info|
#             Facility.new({
#             name: office_info[:dmv_office] || office_info[:office_name] || office_info[:name],
#             address: office_info[:address_li] || office_info[:street_address_line_1] || office_info[:address1],
#             phone: office_info[:phone] || office_info[:public_phone_number],
#             services: office_info[:services_p]
#             })
#         end
#     end
# end



#  NY's info:
# > [{:office_name=>"HUNTINGTON",
#   :public_phone_number=>"7184774820",
#   :street_address_line_1=>"1815 E JERICHO TURNPIKE",
#   
#  MO
# :name=>"FERGUSON-OFFICE CLOSED UNTIL FURTHER NOTICE",
# :address1=>"10425 WEST FLORISSANT",
#  :phone=>"(314) 733-5316",