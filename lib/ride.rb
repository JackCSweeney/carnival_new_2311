class Ride

    attr_reader :name,
                :min_height,
                :admission_fee,
                :excitement,
                :rider_log

    def initialize(info)
        @name = info[:name]
        @min_height = info[:min_height]
        @admission_fee = info[:admission_fee]
        @excitement = info[:excitement]
        @rider_log = {}
    end
end