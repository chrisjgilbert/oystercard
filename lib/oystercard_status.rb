class OysterCardStatus
  attr_reader :in_journey

  def initialize(in_journey = false)
    @in_journey = in_journey
  end

  def touch_in
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
