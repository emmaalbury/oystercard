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
  end
end

# topup = Oystercard.new(20)
# expect(topup.top_up(amount)).to eq(20)
