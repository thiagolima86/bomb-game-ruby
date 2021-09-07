require 'spec_helper'

RSpec.describe Feedback do
  subject { described_class.new(computer_num, user_num) }
  context 'when a number matches, but is not in position' do
    let(:computer_num) { 456.to_s }
    let(:user_num) { 234.to_s }

    it { expect(subject.call).to eq '•' }
  end

  context 'when a number matches exactly' do
    let(:computer_num) { 456.to_s }
    let(:user_num) { 236.to_s }

    it { expect(subject.call).to eq '✓' }
  end

  context 'when a number matches exactly and outher not' do
    let(:computer_num) { 4568.to_s }
    let(:user_num) { 4357.to_s }

    it { expect(subject.call).to eq '✓•' }
  end

  context 'when all number are exactly' do
    let(:computer_num) { 65432.to_s }
    let(:user_num) { 65432.to_s }

    it { expect(subject.call).to eq '✓✓✓✓✓' }
  end

  context 'when all number are exactly less one' do
    let(:computer_num) { 65332.to_s }
    let(:user_num) { 65432.to_s }

    it { expect(subject.call).to eq '✓✓✓✓•' }
  end
end