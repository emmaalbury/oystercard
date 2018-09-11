require 'oystercard'

describe Oystercard do

#Florence, Tom and Em.
#   require "oystercard"
#
# describe Oystercard do
#     context "creating the oyster card" do
#
#         it "expects no error when creating Oystercard instance" do
#             expect {Oystercard.new}.not_to raise_error
#         end
#
#         it "has a default balance of 0 unless stated otherwise" do
#             expect(subject.balance).to eq 0
#         end
#
#     end
#
#     context "spending and topping up our card" do
#         it "allows the user to top up money" do
#             expect(subject.top_up(10)).to eq 10
#         end
#
#         it "after top up, balance is updated" do
#             subject.top_up(15)
#             expect(subject.balance).to eq 15
#         end
#
#         let(:card) { described_class.new(90) }
#
#         it "raises error when balance is more than 90" do
#             expect {card.top_up(1)}.to raise_error("You cannot top up over £90")
#         end
#
#         it "deducts money from my card balance" do
#             expect(card.deduct(23)).to eq 67
#         end
#     end
#
#     context "touching in and out, and checking if it's in journey" do
#         let(:card) { described_class.new }
#         let(:tube_station) { double :tube_station}
#         let(:tube_exit) { double :tube_exit}
#
#
#
#         it "determines if card is on a journey" do
#             #sallow(card).to receive() { false }
#             expect(card.in_journey?).to eq false
#         end
#
#         it "touches in, turning journey to true" do
#             card = described_class.new(10)
#             allow(card).to receive(:in_journey?) { false }
#             expect(card.touch_in(tube_station)).to eq true    #to be_truthy
#         end
#
#         it "touches out, turning journey to false" do
#             allow(card).to receive(:in_journey?) { true }
#             expect(card.touch_out(tube_exit)).to be_falsey
#         end
#
#         it "raises error if touching in with balance of less than 1" do
#           oys = Oystercard.new
#             expect { oys.touch_in("station") }.to raise_error("You're not passing with THAT balance")
#         end
#
#         it "remembers entry station after touch in" do
#           card.top_up(5)
#             card.touch_in(tube_station)
#            expect(card.entry_station).to eq [tube_station]
#         end
#
#
#     end
  context "creating the oyster card" do
    it "expects no error when creating Oystercard instance" do
      expect {Oystercard.new}.not_to raise_error
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

    describe '#deduct' do
      it 'deducts fare amount from balance' do
        subject.top_up(20)
        expect{ subject.deduct 10 }.to change{ subject.balance }.by -10
      end
    end
  end

    context "declares state of use" do
      let(:card) { described_class.new }
       let(:tube_station) { double :tube_station}
       let(:tube_exit) { double :tube_exit}

     it "determines if card is on a journey" do
        expect(card.in_journey?).to eq false
      end

      it "touches in, turning journey to true" do
        card = described_class.new(10)
        allow(card).to receive(:in_journey?) { false }
        expect(card.touch_in(tube_station)).to be true
      end

      it "touches out, turning journey to false" do
          allow(card).to receive(:in_journey?) { true }
          expect(card.touch_out(tube_exit)).to be_falsey
      end

      it "raises error if touching in with balance of less than 1" do
          oys = Oystercard.new
          expect { oys.touch_in("station") }.to raise_error("You're not passing with THAT balance")
        end

        it "remembers entry station after touch in" do
          card.top_up(5)
          card.touch_in(tube_station)
          expect(card.entry_station).to eq [tube_station]
        end
      end
    end
end
