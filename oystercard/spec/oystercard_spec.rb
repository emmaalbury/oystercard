require 'oystercard'

describe Oystercard do

  context "creating the oyster card" do
    it "expects no error when creating Oystercard instance" do
      expect {Oystercard.new}.not_to raise_error
    end
  end

  context "balance on oystercard" do
    it "returns balance of 0" do
      expect(subject.balance).to eq(0)
    end

    describe '#top_do' do
      it { is_expected.to respond_to(:top_up).with(1).argument }

      it 'tops up the balance' do
        expect{ subject.top_up 1}.to change{ subject.balance }.by 1
      end

      it 'raises error if top-up amount exceeds limit' do
        max = Oystercard::MAXIMUM_BALANCE
        subject.top_up(max)
        expect{ subject.top_up 1 }.to raise_error("The maximum balance of #{max} has been exceeded")
      end
    end
  end

    # describe '#deduct' do
    #   it 'deducts fare amount from balance' do
  #   #     subject.top_up(20)
  #   #     expect{ subject.deduct 10 }.to change{ subject.balance }.by -10
  #   #   end
  #   # end
  # end

    context "declares state of use" do
      let(:card) { described_class.new }
       # let(:tube_station) { double :tube_station}
       # let(:tube_exit) { double :tube_exit}

     # it "determines if card is on a journey" do
     #    expect(card.in_journey?).to eq false
     #  end

      # it "touches in, turning journey to true" do
      #   card = described_class.new(10)
      #   allow(card).to receive(:in_journey?) { false }
      #   expect(card.touch_in(tube_station)).to be true
      # end
      #
      #  it "touches out, turning journey to false" do
      #      allow(card).to receive(:in_journey?) { nil }
      #      expect(card.in_journey?).to be false
      #  end

      it "raises error if touching in with balance of less than 1" do
          oys = Oystercard.new
          expect { oys.touch_in("station") }.to raise_error("You're not passing with THAT balance")
      end
    end
end
