class FacilityFactory

    def create_office(info)
        info.map do |office_info|
            Facility.new({
            name: office_info[:dmv_office] || office_info[:office_name],
            address: office_info[:address_li] || office_info[:street_address_line_1],
            phone: office_info[:phone] || office_info[:public_phone_number],
            services: office_info[:services_p]
            })
        end

    end

end
#  NY's info:
# > [{:office_name=>"HUNTINGTON",
#   :public_phone_number=>"7184774820",
#   :street_address_line_1=>"1815 E JERICHO TURNPIKE",
#   