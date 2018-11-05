require 'oystercard_status'

describe OysterCardStatus do

  it { is_expected.to respond_to(:touch_in) }

  let(:oystercard) { double :oystercard, :in_journey => false }

  describe '#initialize' do
    it 'sets in journey to false by default' do
      expect(subject.in_journey).to eq false
    end
  end

  describe '#touch_in' do
    it 'changes oystercard status to in journey' do
      subject.touch_in
      expect(subject.in_journey).to eq true
    end
  end

end
