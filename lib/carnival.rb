class Carnival

    attr_reader :duration,
                :rides

    def initialize(duration)
        @duration = duration
        @rides = []
    end

    def add_ride(ride)
        @rides << ride
    end

    def most_popular_ride
        @rides.max_by {|ride| ride.rider_log.values.sum}
    end

    def most_profitable_ride
        @rides.max_by {|ride| ride.total_revenue}
    end

    def total_revenue
        @rides.sum do |ride|
            ride.total_revenue
        end
    end

    def visitors
        visitors = []
        @rides.each do |ride|
            ride.rider_log.each do |visitor, _|
                visitors << visitor
            end 
        end
        visitors.uniq
    end

    def visitor_count
        visitors.count
    end

    def favorite_ride(visitor)
        rides_ridden = []
        @rides.each do |ride|
            ride.rider_log.each do |rider, times|
                rides_ridden << ride if visitor == rider
            end
            rides_ridden.sort_by do |ride|
                ride.rider_log[visitor]
            end
        end
        rides_ridden.first
    end


    def summary
    end


end