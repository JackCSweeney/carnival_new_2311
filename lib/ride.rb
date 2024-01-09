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

    def board_rider(rider)
        if rider.tall_enough?(@min_height) && rider.preferences.include?(@excitement)
            rider.pay_fee(@admission_fee)
            @rider_log[rider] == nil ? @rider_log[rider] = 1 : @rider_log[rider] += 1
        end
    end

    def total_revenue
        @rider_log.empty? ? 0 : @rider_log.values.sum * @admission_fee
    end

end