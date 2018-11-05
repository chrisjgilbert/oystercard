class OysterCard
  attr_reader :balance
  DEFAULT_BALANCE = 0
  def initialize(default_balance = DEFAULT_BALANCE)
    @balance = default_balance
  end

end
