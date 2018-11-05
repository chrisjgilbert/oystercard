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
      expect(subject.top_up(5)).to eq subject.balance
    end
  end

end
