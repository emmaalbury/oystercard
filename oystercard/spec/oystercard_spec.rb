require 'oystercard'

describe Oystercard do

  context "balance on oystercard" do
    it "returns balance of 0" do
      expect(subject.balance).to eq(0)
    end
  end
end
