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
    it 'does not remove bounded stations' do
      subject.remove_station(first)
      expect(subject.stations_list).to include(first)
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
  end
  describe '#show_stations_list' do
  end
end
class Route
  attr_reader :first_station, :last_station
  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @transfer_stations = []
  end
  def add_station(station)
    @transfer_stations << station
    @transfer_stations.uniq!
    @transfer_stations
  end
  def remove_station(station)
    @transfer_stations.delete(station)
  end
  def stations_list
    [@first_station, *@transfer_stations, @last_station]
  end
  def show_stations_list
    stations_list.each { |station| puts station.name }
  end
end
