class Visitor

    attr_reader :name,
                :height,
                :spending_money,
                :preferences,
                :money_spent

    def initialize(name, height, spending_money)
        @name = name
        @height = height
        @spending_money = spending_money.delete('$').to_i
        @preferences = []
        @money_spent = 0
    end

    def add_preference(preference)
        @preferences << preference
    end

    def tall_enough?(height)
        @height >= height ? true : false
    end

    def pay_fee(fee)
        @spending_money -= fee
        @money_spent += fee
    end
end