require_relative '../../lesson4/route.rb'

RSpec.describe Route do
  let(:first) { 'First station' }
  let(:last) { 'Last station' }
  let(:transfer) { 'transfer' }
  subject { Route.new(first, last) }
  describe '#add_station' do
    it 'adds stations' do
      expect(subject.add_station(transfer)).to include(transfer)
    end
    it 'increase number of stations' do
      expect { subject.add_station(transfer) }.to change {
        subject.stations_list.count
      }.by(1)
    end
    it 'ignores station duplication' do
      subject.add_station(transfer)
      subject.add_station(transfer)
      expect(subject.stations_list.count(transfer)).to eq(1)
    end
  end
  describe '#remove_station' do
    subject do
      route = Route.new(first, last)
      route.add_station(transfer)
      route
    end
    it 'does not remove first station' do
      subject.remove_station(first)
      expect(subject.stations_list).to include(first)
    end
    it 'does not remove last stations' do
      subject.remove_station(last)
      expect(subject.stations_list).to include(last)
    end
    it 'delets transfer stations only' do
      subject.remove_station(transfer)
      expect(subject.stations_list).not_to include(transfer)
    end
    it 'decincrease number of stations' do
      expect { subject.remove_station(transfer) }.to change {
        subject.stations_list.count
      }.by(-1)
    end
  end
  describe '#stations_list' do
    it 'return stations list' do
      expect(subject.stations_list).to match_array([first, last])
    end
  end
  describe '#show_stations_list' do
    it 'return stations list to stdout' do
      expect { subject.show_stations_list }.to output(a_string_including(first)).to_stdout
    end
  end
end
