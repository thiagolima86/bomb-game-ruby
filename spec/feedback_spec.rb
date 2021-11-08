require 'feedback'

RSpec.describe Feedback do
  subject { described_class.new(number, user_num) }

  let(:number) { Number.new(computer_num).create }

  context 'when a number matches, but is not in position' do
    let(:computer_num) { 3 }
    let(:user_num) { 256.to_s }

    it { expect(subject.call).to eq '•' }
  end

  context 'when a number matches exactly' do
    let(:computer_num) { 3 }
    let(:user_num) { 524.to_s }

    it { expect(subject.call).to eq '✓' }
  end

  context 'when a number matches exactly and outher not' do
    let(:computer_num) { 4 }
    let(:user_num) { 3267.to_s }

    it { expect(subject.call).to eq '✓•' }
  end

  context 'when all number are exactly' do
    let(:computer_num) { 5 }
    let(:user_num) { 12345.to_s }

    it { expect(subject.call).to eq '✓✓✓✓✓' }
  end

  context 'when all number are exactly less one' do
    let(:computer_num) { 5 }
    let(:user_num) { 12545.to_s }

    it { expect(subject.call).to eq '✓✓✓✓•' }
  end
end
