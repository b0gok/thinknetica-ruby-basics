require_relative '../../lesson4/train.rb'

RSpec.describe Train do
  let(:number) { '1111' }
  let(:type) { 'cargo' }
  subject { Train.new(number, type) }
  describe '#stop' do
    it 'Set speed to zero' do
      subject.stop
      expect(subject.speed).to eq(0)
    end
  end
end
