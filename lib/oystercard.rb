require_relative 'station'
require_relative 'journey'

class OysterCard

  DEFAULT_BALANCE = 0
  MAX_LIMIT = 90
  MIN_FARE = 1

  attr_reader :balance, :max_limit, :min_fare, :entry_station, :journey_history

  def initialize(default_balance = DEFAULT_BALANCE, max_limit = MAX_LIMIT, min_fare = MIN_FARE)
    @balance = default_balance
    @max_limit = max_limit
    @min_fare = min_fare
    @journey_history = []
  end

  def top_up(value)
    fail "Your balance is currently #{@balance} and your limit is #{@max_limit}" if exceed_max_limit?(value)
    @balance += value
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    @entry_station = station unless insufficient_funds?
    save_journey(:departure_station, station)
  end

  def touch_out(station)
    @entry_station = nil
    deduct
    save_journey(:arrival_station, station)
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

  def save_journey(journey_type, station)
    @journey_history << {journey_type => station}
  end

end
