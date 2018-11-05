require_relative 'oystercard_status'

class OysterCard

  attr_reader :balance, :card_status

  DEFAULT_BALANCE = 0
  MAX_LIMIT = 90

  def initialize(default_balance = DEFAULT_BALANCE, max_limit = MAX_LIMIT, card_status = OysterCardStatus.new)
    @balance = default_balance
    @max_limit = max_limit
    @card_status = card_status
  end

  def top_up(value)
    fail "Your balance is currently #{@balance} and your limit is #{OysterCard::MAX_LIMIT}" if exceed_max_limit?(value)
    @balance += value
    value
  end

  def deduct(value)
    @balance -= value
    value
  end

  private

  def exceed_max_limit?(value)
    (@balance + value) > @max_limit
  end

end
