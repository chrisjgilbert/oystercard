class OysterCard

  attr_reader :balance, :max_limit, :min_fare, :entry_station

  DEFAULT_BALANCE = 0
  MAX_LIMIT = 90
  MIN_FARE = 1

  def initialize(default_balance = DEFAULT_BALANCE, max_limit = MAX_LIMIT, min_fare = MIN_FARE)
    @balance = default_balance
    @max_limit = max_limit
    @min_fare = min_fare
  end

  def top_up(value)
    fail "Your balance is currently #{@balance} and your limit is #{@max_limit}" if exceed_max_limit?(value)
    @balance += value
  end

  def in_journey?
    @in_journey
  end

  def touch_in(entry_station)
    @in_journey = true unless insufficient_funds?
    @entry_station = entry_station
  end

  def touch_out
    @in_journey = false
    deduct
  end

  private

  def deduct(value = min_fare)
    @balance -= value
  end

  def exceed_max_limit?(value)
    @balance + value > max_limit
  end

  def insufficient_funds?
    fail 'You have insufficient funds to touch in' if @balance < min_fare
  end

end
