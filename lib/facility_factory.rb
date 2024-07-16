class FacilityInfo
    attr_reader :geom, :id, :office, :address_1, :address_2,
                :city, :state, :zip, :phone, :hours, :services,
                :parking, :photo, :address_id, :comp_region, 
                :comp_region_2, :comp_region_3, :county, 
                :office_type, :fax, :email, :texting_num, :size,
                :region_num #:format_hours
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
        @fax = details[:fax]
        @email = details[:email]
        @texting_num = details[:texting_num]
        @hours = details[:hours]
        #####
        #@format_hours = details[:ny_hours]
        #####
        @services = details[:services]
        @parking = details[:parking]
        @photo = details[:photo]
        @address_id = details[:address_id]
        @comp_region = details[:comp_region]
        @comp_region_2 = details[:comp_region_2]
        @comp_region_3 = details[:comp_region_3]
        @office_type = details[:office_type]
        @county = details[:county]
        @size = details[:size]
        @region_num = details[:region_num]
    end

    # private

    # def ny_hours(details)
    #     days = %w[monday tuesday wednesday thursday friday]
    #     hours = days.map do |day|
    #         start_key = "#{day}_beginning_hours".to_sym
    #         end_key = "#{day}_ending_hours".to_sym
    #         start = details[start_key]
    #         ending = details[end_key]
    #         "#{day.capitalize}: #{start} - #{ending}" if start && ending
    #     end.compact
    #     hours.join(', ')
  
    # end

end

class FacilityFactory
        def create_office(info)
            info.map do |office_info|
                FacilityInfo.new({
                geom: office_info[:the_geom] || office_info[:georeference] || office_info[:latlng],
                id: office_info[:dmv_id] || office_info[:number],
                office: office_info[:dmv_office] || office_info[:office_name] || office_info[:name],
                address_1: office_info[:address_li] || office_info[:street_address_line_1] || office_info[:address1],
                address_2: office_info[:address__1],
                city: office_info[:city],
                state: office_info[:state],
                zip: office_info[:zip] || office_info[:zip_code] || office_info[:zipcode],
                phone: office_info[:phone] || office_info[:public_phone_number],
                fax: office_info[:fax],
                email: office_info[:email],
                texting_num: office_info[:textingphonenumber],
                hours: office_info[:hours],
                #####
                # format_hours: ny_hours(office_info),
                #####
                services: office_info[:services_p] || office_info[:additional_license_office_info],
                parking: office_info[:parking_no] || office_info[:located_in],
                photo: office_info[:photo],
                address_id: office_info[:address_id],
                comp_region: office_info[:":@computed_region_nku6_53ud"] || office_info[:":@computed_region_yamh_8v7k"] || office_info[:":@computed_region_ny2h_ckbz"],
                comp_region_2: office_info[:":@computed_region_wbg7_3whc"] || office_info[:":@computed_region_c8ar_jsdj"] ,
                comp_region_3: office_info[:":@computed_region_kjdx_g34t"] || office_info[:":@computed_region_ikxf_gfzr"],
                office_type: office_info[:office_type] || office_info[:type],
                county: office_info[:county],
                size: office_info[:size],
                region_num: office_info[:dorregionnumber]
                })
            end
        end
end
