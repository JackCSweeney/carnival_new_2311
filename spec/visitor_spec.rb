require 'spec_helper'
require './lib/visitor'

RSpec.describe Visitor do
    describe '#initialize' do
        it 'exists' do
            visitor1 = Visitor.new('Bruce', 54, '$10')

            expect(visitor1).to be_a(Visitor)
        end

        it 'has a name' do
            visitor1 = Visitor.new('Bruce', 54, '$10')

            expect(visitor1.name).to eq('Bruce')
        end

        it 'has a height' do
            visitor1 = Visitor.new('Bruce', 54, '$10')
            
            expect(visitor1.height).to eq(54)
        end

        it 'has spending money' do
            visitor1 = Visitor.new('Bruce', 54, '$10')

            expect(visitor1.spending_money).to eq(10)
        end

        it 'starts with no preferences' do
            visitor1 = Visitor.new('Bruce', 54, '$10')

            expect(visitor1.preferences).to eq([])
        end
    end

    describe '#add_preference(preference)' do
        it 'can add preferences' do
            visitor1 = Visitor.new('Bruce', 54, '$10')

            visitor1.add_preference(:gentle)

            expect(visitor1.preferences).to eq([:gentle])

            visitor1.add_preference(:thrilling)

            expect(visitor1.preferences).to eq([:gentle, :thrilling])
        end
    end

    describe '#tall_enough?' do
        it 'can tell if a visitor is tall enough for a ride' do
            visitor1 = Visitor.new('Bruce', 54, '$10')
            visitor2 = Visitor.new('Tucker', 36, '$5')
            visitor3 = Visitor.new('Penny', 64, '$15')

            expect(visitor1.tall_enough?(54)).to eq(true)
            expect(visitor2.tall_enough?(54)).to eq(false)
            expect(visitor3.tall_enough?(54)).to eq(true)
            expect(visitor1.tall_enough?(64)).to eq(false)
        end
    end
end


