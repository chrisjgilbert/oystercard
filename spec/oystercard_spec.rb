require 'oystercard'

describe OysterCard do

  it { is_expected.to respond_to(:balance) }
  it { is_expected.to be_instance_of(OysterCard) }

  describe '#balance' do
    it 'returns the user balance' do
      expect(subject.balance).to eq 0
    end
  end

end
