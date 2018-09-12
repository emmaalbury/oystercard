class Oystercard

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
STARTING_BALANCE = 0

  attr_reader :balance, :journey, :beginning_station, :store_journey

  def initialize(starting_balance = STARTING_BALANCE)
    @balance = starting_balance
    @beginning_station = nil
    @store_journey = []

  end

  def top_up(amount)
    fail "The maximum balance of #{MAXIMUM_BALANCE} has been exceeded" if amount + @balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in(tube_station)
    raise "You're not passing with THAT balance" if @balance <= MINIMUM_BALANCE
    @beginning_station = tube_station
  end

  def touch_out(exit_station)
    store_journey << { entry_station: beginning_station, exit_station: exit_station }
  end

  def in_journey?
    @beginning_station != nil
  end
end
