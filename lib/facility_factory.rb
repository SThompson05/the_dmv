class FacilityFactory

    def create_office(info)
        info.map do |office_info|
            Facility.new({
            name: office_info[:dmv_office],
            address: office_info[:address_li],
            address_1: office_info[:address_1],
            city: office_info[:city],
            state: office_info[:state],
            zip: office_info[:zip],
            phone: office_info[:phone],
            # services: office_info[:services_p]
            })
        end

    end

end
