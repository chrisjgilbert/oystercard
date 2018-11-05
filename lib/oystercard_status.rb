class OysterCardStatus

  attr_reader :in_journey, :min_fare

  MIN_FARE = 1

  def initialize(in_journey = false, min_fare = MIN_FARE)
    @in_journey = in_journey
    @min_fare = min_fare
  end

  def touch_in(balance)
    fail 'You dont have suffient balance to touch in' if balance < @min_fare
    @in_journey = true
    self
  end

  def touch_out
    @in_journey = false
    self
  end

  def in_journey?
    @in_journey
  end

end
