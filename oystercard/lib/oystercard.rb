class Oystercard

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

  attr_reader :balance, :journey, :entry_station

  def initialize(balance = 0)
    @balance = balance
    @journey = false
    @entry_station = []
  end

  def top_up(amount)
    fail "The maximum balance of #{MAXIMUM_BALANCE} has been exceeded" if amount + @balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    if @entry_station == []
      return false
    else
      return true
    end
  end

  def touch_in(tube_station)
    raise "You're not passing with THAT balance" if @balance <= MINIMUM_BALANCE
    @entry_station << tube_station
    @journey = true
  end

  def touch_out(exit)
    @journey = false
    @entry_station = nil
  end

end
# class Oystercard
#     attr_reader :balance, :journey, :entry_station
#
# Florence, Tom and Em
#
#     def initialize(balance = 0)
#         @balance = balance
#         @CAPACITY = 90
#         @MINIMUM = 1
#         @journey = false
#         @entry_station = []
#     end
#
#     def top_up(amount)
#         raise "You cannot top up over £#{@CAPACITY}" if @balance >= @CAPACITY
#         @balance += amount
#     end
#
#     def deduct(fare)
#         @balance -= fare
#     end
#
#     def in_journey?
#       if @entry_station == []
#         return false
#       else
#         return true
#       end
#     end
#
#     def touch_in(tube_station)
#         raise "You're not passing with THAT balance" if @balance <= @MINIMUM
#         @entry_station << tube_station
#         @journey = true
#     end
#
#     def touch_out(exit)
#         @journey = false
#         @entry_station = nil
#     end
#
# end
