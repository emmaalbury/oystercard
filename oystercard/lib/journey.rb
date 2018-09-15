require 'oystercard'
require 'station'

class Journey

  def initialize(oyster = Oystercard.new)
    p oyster
    @oyster = oyster
  end

  # def card_balance
  #   @oystercard = @oyster.new
  #   @oystercard.balance
  # end

  def touch_in(tube_station)
    p "Balance"
    p @oyster.balance
    raise "You're not passing with THAT balance" if @oyster.balance < Oystercard::MINIMUM_BALANCE
    @beginning_station = tube_station
  end

  def touch_out(exit_station)
    store_journey << { entry_station: beginning_station, exit_station: exit_station }
  end

  def in_journey?
    @beginning_station != nil
  end
end
