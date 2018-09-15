class Oystercard

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

  attr_reader :balance, :journey, :beginning_station, :store_journey

  def initialize
    @balance = 0
    @beginning_station = nil
    @store_journey = []
  end

  # def touch_in
  #   raise "You're not passing with THAT balance" if @balance < MINIMUM_BALANCE
  # end

  def top_up(amount)
    fail "The maximum balance of #{MAXIMUM_BALANCE} has been exceeded" if amount + @balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end
end
