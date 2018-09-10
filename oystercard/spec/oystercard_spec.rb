require 'oystercard'

describe Oystercard do

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

    describe '#deduct' do
      it 'deducts fare amount from balance' do
        subject.top_up(20)
        expect{ subject.deduct 10 }.to change{ subject.balance }.by -10
      end
    end
  end


  context "declares state of use" do

    describe '#touch_in?' do
      it "returns true if card is in use" do
      expect(subject.touch_in?).to be true
      end
    end

    describe '#touch_out?' do
      it "returns true if card is not in use" do
      expect(subject.touch_out?).to be true
      end
    end

    describe '#in_journey?' do
      it "returns true if card is not in use" do
      expect(subject.in_journey?).to be true
      end
    end
  end
end

# topup = Oystercard.new(20)
# expect(topup.top_up(amount)).to eq(20)


#      allow(subject).to receive(:touch_in?).and_return true
