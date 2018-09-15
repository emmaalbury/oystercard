require 'station'

describe Station do

  let(:station) { described_class.new("Liverpool", 1) }

  it "exposes name variable" do
    expect(station.name).to eq("Liverpool")
  end

  it "exposes zone variable" do
    expect(station.zone).to eq(1)
  end


end
