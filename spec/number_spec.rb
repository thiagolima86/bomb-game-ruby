require 'number'

RSpec.describe Number do
  subject { described_class.new(size).create }

  context 'when number size is 5' do
    let(:size) { 5 }

    it { expect(subject.reveal).to eq '12345' }
    it { expect(subject.locked).to eq '*****' }
  end

  context 'when verify number' do
    let(:size) { 3 }

    it 'with value correct' do
      expect(subject.eq?('123')).to be_truthy
    end

    it 'with value incorrect' do
      expect(subject.eq?('124')).to be_falsey
    end
  end
end
