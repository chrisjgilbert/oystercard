require 'oystercard'

describe OysterCard do

  it { is_expected.to be_instance_of(OysterCard) }
  it { is_expected.to respond_to(:balance) }
  it { is_expected.to respond_to(:top_up).with(1).argument }

  describe '#balance' do
    it 'returns the user balance' do
      expect(subject.balance).to eq 0
    end

    it 'allows the user to top up their balance' do
      expect(subject.top_up(5)).to eq 5
    end

    it 'doesn"t allow the user to top up above card limit (£90)' do
      expect { subject.top_up(95) }.to raise_error "Your balance is currently #{subject.balance} and your limit is #{OysterCard::MAX_LIMIT}"
    end

    it 'doesnt" allow the user to top up the balance above the max limit' do
      subject.top_up(90)
      expect { subject.top_up(5) }.to raise_error "Your balance is currently #{subject.balance} and your limit is #{OysterCard::MAX_LIMIT}"
    end
  end

end
