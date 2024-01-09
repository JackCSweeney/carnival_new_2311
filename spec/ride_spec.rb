require 'spec_helper'
require './lib/visitor' 
require './lib/ride'

RSpec.describe Ride do
    describe '#initialize' do
        it 'exists' do
            ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

            expect(ride1).to be_a(Ride)
        end

        it 'has a name' do
            ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

            expect(ride1.name).to eq('Carousel')
        end

        it 'has a minimum height' do
            ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

            expect(ride1.min_height).to eq(24)
        end

        it 'has an admission fee' do
            ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

            expect(ride1.admission_fee).to eq(1)
        end

        it 'has an excitement description' do
            ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

            expect(ride1.excitement).to eq(:gentle)
        end

        it 'starts with an empty rider log' do
            ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
            
            expect(ride1.rider_log).to eq({})
        end
    end

    describe '#board_rider(rider)' do
        it 'can board a rider and add it to its rider log' do
            ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
            visitor1 = Visitor.new('Bruce', 54, '$10')
            visitor2 = Visitor.new('Tucker', 36, '$5')

            ride1.board_rider(visitor1)

            expect(ride1.rider_log).to eq({visitor1 => 1})

            ride1.board_rider(visitor2)
            ride1.board_rider(visitor1)

            expect(ride1.rider_log).to eq({visitor1 => 2, visitor2 => 1})
        end

        it 'charges the rider the admission fee when boarding the rider' do
            ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
            visitor1 = Visitor.new('Bruce', 54, '$10')
            visitor2 = Visitor.new('Tucker', 36, '$5')

            ride1.board_rider(visitor1)
            ride1.board_rider(visitor1)
            ride1.board_rider(visitor2)

            expect(visitor1.spending_money).to eq(8)
            expect(visitor2.spending_money).to eq(4)
        end
    end
end
