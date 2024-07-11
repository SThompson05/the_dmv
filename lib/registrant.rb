class Registrant
    attr_reader :name, :age, :permit, :license_data

    def initialize(profile)
      @name = profile[:name]
      @age = profile[:age]
      @permit = profile[:permit]
      @license_data = profile[:license_data]
    end
end