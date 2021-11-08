require 'number'
require 'input_number'
require 'input_validate'
require 'io/console'

RSpec.describe InputNumber do
  subject { described_class.new(number.reveal) }

  let(:number) { Number.new(3).create }

  context 'when receive text' do
    it do
      allow(subject).to receive(:request).and_return I18n.t(:write_number)

      expect(subject.request).to include(I18n.t(:write_number))
    end
  end
end
