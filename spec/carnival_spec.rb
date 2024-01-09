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
end