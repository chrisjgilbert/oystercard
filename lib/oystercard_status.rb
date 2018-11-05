
class OysterCardStatus
  attr_reader :in_journey

  def initialize(in_journey = false)
    @in_journey = in_journey
  end

  def touch_in
    @in_journey = true
  end

  def in_journey?
    @in_journey
  end

end
