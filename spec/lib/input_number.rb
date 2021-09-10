require 'spec_helper'
# require 'stringio'

RSpec.describe InputNumber do
  subject { described_class.new(number).request }
  let(:number) { Number.new(3) }
  context 'when receive text' do
    it do
      output = 'Write one number with 3 digits: '
      expect { subject }.to output(output).to_stdout
    end
  end
end
