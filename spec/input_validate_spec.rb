require 'input_validate'

RSpec.describe InputValidate do
  subject { described_class.new(number, user_num) }

  let(:number) { Number.new(computer_num).create }
  context 'when user num is valid' do
    let(:computer_num) { 3 }
    let(:user_num) { 234.to_s }

    it { expect(subject.call).to be_truthy }
  end

  context 'when user num is great' do
    let(:computer_num) { 3 }
    let(:user_num) { 2345.to_s }

    it { expect(subject.call).to be_falsey }
    it { expect(subject.message).to eq I18n.t('input_validate.size_incorrect') }
  end

  context 'when user num has caracter alphanumeric' do
    let(:computer_num) { 3 }
    let(:user_num) { '23a' }

    it { expect(subject.call).to be_falsey }
    it { expect(subject.message).to eq I18n.t('input_validate.type_incorrect') }
  end

  context 'when user num is empty' do
    let(:computer_num) { 3 }
    let(:user_num) { '' }

    it { expect(subject.call).to be_falsey }
    it { expect(subject.message).to eq I18n.t('input_validate.empty_invalid') }
  end
end