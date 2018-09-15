require 'journey'
require 'oystercard'

describe Journey do

    let(:oystercard) { double('oystercard', balance: 3) }
    # let(:oystercard_class) { double('oystercard_class', new: oystercard)}


    subject(:journey) { described_class.new(oystercard) }

    it "remembers entry station after touch in" do
      journey.touch_in("Manor House")
      expect(journey.beginning_station).to eq "Manor House"
    end

    it "begins with an empty list for journeys" do
      expect(journey.store_journey).to eq []
    end

    it "stores journey in a hash in touch_out" do
      journey.touch_in("Hammersmith")
      journey.touch_out("Liverpool")
      expect(journey.store_journey).to eq([{ entry_station: "Hammersmith", exit_station: "Liverpool" }])
    end
end
