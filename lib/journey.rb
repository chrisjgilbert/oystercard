class Journey

  attr_reader :entry_station

  def initialize
    
  end

  def in_journey?
    @entry_station != nil
  end

end
