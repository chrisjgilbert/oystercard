class OysterCard

  attr_reader :balance, :max_limit, :min_fare, :in_journey

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
    @in_use
  end

  def touch_in
    @in_use = true unless insufficient_funds?
  end

  def touch_out
    @in_use = false
    deduct
  end

  private

  def deduct(value = @min_fare)
    @balance -= value
  end

  def exceed_max_limit?(value)
    @balance + value > @max_limit
  end

  def insufficient_funds?
    fail 'You have insufficient funds to touch in' if @balance < @min_fare
  end

end
