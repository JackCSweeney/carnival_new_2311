class Visitor

    attr_reader :name,
                :height,
                :spending_money,
                :preferences

    def initialize(name, height, spending_money)
        @name = name
        @height = height
        @spending_money = spending_money.delete('$').to_i
        @preferences = []
    end

    def add_preference(preference)
        @preferences << preference
    end

    def tall_enough?(height)
        @height >= height ? true : false
    end

    def pay_fee(fee)
        @spending_money -= fee
    end
end