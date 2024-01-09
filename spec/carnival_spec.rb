require 'spec_helper'
require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do
    describe '#initialize' do
        it 'exists' do
            carnival = Carnival.new(4)

            expect(carnival).to be_a(Carnival)
        end

        it 'has a duration' do
            carnival = Carnival.new(4)

            expect(carnival.duration).to eq(4)
        end

        it 'starts with no rides' do
            carnival = Carnival.new(4)

            expect(carnival.rides).to eq([])
        end
    end

    describe '#add_ride(ride)' do
        it 'can add rides to its list of rides' do
            carnival = Carnival.new(4)

            ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
            ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
            ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

            carnival.add_ride(ride1)
            carnival.add_ride(ride2)
            carnival.add_ride(ride3)

            expect(carnival.rides).to eq([ride1, ride2, ride3])
        end
    end

    describe '#most_popular_ride & #most_profitable_ride' do
        before(:each) do
            @carnival = Carnival.new(4)

            @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
            @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
            @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

            @carnival.add_ride(@ride1)
            @carnival.add_ride(@ride2)
            @carnival.add_ride(@ride3)

            @visitor1 = Visitor.new('Bruce', 54, '$10')
            @visitor2 = Visitor.new('Tucker', 36, '$6')
            @visitor3 = Visitor.new('Penny', 64, '$15')

            @visitor1.add_preference(:gentle)
            @visitor2.add_preference(:gentle)
            @visitor2.add_preference(:thrilling)
            @visitor3.add_preference(:thrilling)

            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor2)
            @ride2.board_rider(@visitor1)
            @ride2.board_rider(@visitor2)
            @ride3.board_rider(@visitor3)
            @ride3.board_rider(@visitor3)
            @ride3.board_rider(@visitor3)
            @ride3.board_rider(@visitor3)
        end

        it 'can tell you the most popular ride' do

            expect(@carnival.most_popular_ride).to eq(@ride3)
        
        end

        it 'can tell you the most profitable ride' do

            expect(@carnival.most_profitable_ride).to eq(@ride2)

        end
    end

    describe '#total_revenue' do
        before(:each) do
            @carnival = Carnival.new(4)

            @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
            @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
            @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

            @carnival.add_ride(@ride1)
            @carnival.add_ride(@ride2)
            @carnival.add_ride(@ride3)

            @visitor1 = Visitor.new('Bruce', 54, '$10')
            @visitor2 = Visitor.new('Tucker', 36, '$6')
            @visitor3 = Visitor.new('Penny', 64, '$15')

            @visitor1.add_preference(:gentle)
            @visitor2.add_preference(:gentle)
            @visitor2.add_preference(:thrilling)
            @visitor3.add_preference(:thrilling)

            @ride1.board_rider(@visitor1) 
            @ride1.board_rider(@visitor2) 
            @ride2.board_rider(@visitor1) 
            @ride2.board_rider(@visitor2) 
            @ride3.board_rider(@visitor3) 
            @ride3.board_rider(@visitor3) 
            @ride3.board_rider(@visitor3) 
            @ride3.board_rider(@visitor3) 
        end

        it 'can tell you the the total revenue for all rides in the carnival combined' do

            expect(@carnival.total_revenue).to eq(20)
            
        end
    end

    describe '#summary' do
        before(:each) do
            @carnival = Carnival.new(4)

            @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
            @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
            @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

            @carnival.add_ride(@ride1)
            @carnival.add_ride(@ride2)
            @carnival.add_ride(@ride3)

            @visitor1 = Visitor.new('Bruce', 54, '$10')
            @visitor2 = Visitor.new('Tucker', 36, '$6')
            @visitor3 = Visitor.new('Penny', 64, '$15')

            @visitor1.add_preference(:gentle)
            @visitor2.add_preference(:gentle)
            @visitor2.add_preference(:thrilling)
            @visitor3.add_preference(:thrilling)

            @ride1.board_rider(@visitor1) 
            @ride1.board_rider(@visitor1) 
            @ride1.board_rider(@visitor2) 
            @ride2.board_rider(@visitor1) 
            @ride2.board_rider(@visitor2) 
            @ride3.board_rider(@visitor3) 
            @ride3.board_rider(@visitor3) 
            @ride3.board_rider(@visitor3) 
            @ride3.board_rider(@visitor3) 
        end

        it 'can count how many unique visitors have entered the carnival' do
            
            expect(@carnival.visitor_count).to eq(3)

        end

        it 'can return the unique visitors that have entered the park' do

            expect(@carnival.visitors).to eq([@visitor1, @visitor2, @visitor3])

        end

        it 'can tell you a visitors favorite ride' do

            expect(@carnival.favorite_ride(@visitor1)).to eq(@ride1)
            expect(@carnival.favorite_ride(@visitor2)).to eq(@ride1)
            expect(@carnival.favorite_ride(@visitor3)).to eq(@ride3)
            
        end

        it 'can return a summary of the carnival' do
            expect(@carnival.summary).to eq({
                visitor_count: 3, 
                revenue_earned: 21, 
                visitors: [
                  {
                    visitor: @visitor1,
                    favorite_ride: @ride1,
                    total_money_spent: 7
                  }, 
                  {
                    visitor: @visitor2,
                    favorite_ride: @ride1,
                    total_money_spent: 6
                  },
                  {
                    visitor: @visitor3,
                    favorite_ride: @ride3,
                    total_money_spent: 8
                  }],
                rides: [
                  {
                    ride: @ride1,
                    riders: [@visitor1, @visitor2],
                    total_revenue: 3
                  },
                  {
                    ride: @ride2,
                    riders: [@visitor1, @visitor2],
                    total_revenue: 10
                  },
                  {
                    ride: @ride3,
                    riders: [@visitor3],
                    total_revenue: 8
                  }]
                })
            end
        end


end