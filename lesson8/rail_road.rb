# frozen_string_literal: true

require_relative 'train_pass'
require_relative 'train_cargo'
require_relative 'wagon_pass'
require_relative 'wagon_cargo'
require_relative 'station'
require_relative 'route'

# Rail Road main class
class RailRoad
  def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagons = []
  end

  def top_menu_text
    puts 'Введите 1, если хотите создать станцию, поезд, вагон или маршрут'
    puts 'Введите 2, если хотите произвести операцию с созданными объектами'
    puts 'Введите 3, если хотите вывести текущие данные об объектах'
    puts 'Введите стоп для выхода из меню'
  end

  def menu
    loop do
      top_menu_text
      choise = gets.chomp

      case choise
      when 'стоп'
        break
      when '1'
        create
      when '2'
        edit
      when '3'
        show
      else
        wrong_command_text
      end
    end
  end

  private

  def exit_text
    puts 'Введите назад для выхода из меню'
  end

  def wrong_command_text
    puts 'Вы ввели несуществующую команду.'
  end

  def train_list
    @trains.each_with_index { |train, index| puts "#{index}: #{train.number}" }
  end

  def station_list
    @stations.each_with_index do |station, index|
      puts "#{index}: #{station.name}"
    end
  end

  def route_list
    @routes.each_with_index { |route, index| puts "#{index}: #{route.first_station} — #{route.last_station}" }
  end

  def choosen_route
    route_list
    puts 'Введите номер маршрута'
    route_index = gets.chomp.to_i
    @routes[route_index]
  end

  def created_station
    begin
      puts 'Введите название станции'
      station_name = gets.chomp
      station = Station.new(station_name)
    rescue RuntimeError => e
      puts "Произошла ошибка! #{e.message}"
      retry
    end
    puts "Станция #{station_name} успешно создана!"
    station
  end

  def create_menu_text
    puts 'Введите 1, если хотите создать станцию'
    puts 'Введите 2, если хотите создать поезд'
    puts 'Введите 3, если хотите создать маршрут'
    exit_text
  end

  def create
    loop do
      create_menu_text

      choise = gets.chomp

      case choise
      when 'назад'
        break
      when '1'
        @stations << created_station
      when '2'
        puts 'Введите тип поезда (грузовой, пассажирский)'
        train_type = gets.chomp
        begin
          puts 'Введите номер поезда'
          train_number = gets.chomp
          if train_type == 'грузовой'
            puts 'Введите объём'
            capacity = gets.chomp
          else
            puts 'Введите кол-во мест'
            seats = gets.chomp
          end
          @trains << TrainCargo.new(train_number, capacity) if train_type == 'грузовой'
          @trains << TrainPass.new(train_number, seats) if train_type == 'пассажирский'
        rescue RuntimeError => e
          puts "Произошла ошибка! #{e.message}"
          retry
        end
        puts "Поезд #{train_number} успешно создан!"
      when '3'
        puts 'Введите начальную станцию'
        first_station = gets.chomp
        puts 'Введите конечную станцию'
        last_station = gets.chomp
        @routes << Route.new(first_station, last_station)
      else
        wrong_command_text
      end
    end
  end

  def edit_train_text
    puts 'Введите 1, если хотите добавить вагон'
    puts 'Введите 2, если хотите отцепить вагон'
    puts 'Введите 3, если хотите отправить поезд'
    puts 'Введите 4, если хотите вернуть поезд'
    puts 'Введите 5, если хотите назначить маршрут'
    puts 'Введите 6, если хотите приозвести действие с вагоном'
    exit_text
  end

  def edit_train
    if @trains.empty?
      puts 'Вы ещё не создали ни одного поезда'
      return
    end

    train_list
    puts 'Введите индекс поезда'
    train_index = gets.chomp.to_i
    train = @trains[train_index]

    loop do
      edit_train_text

      choise = gets.chomp

      case choise
      when 'назад'
        break
      when '1'
        wagon = pass_train?(train) ? WagonPass.new : WagonCargo.new
        train.add_wagon(wagon)
      when '2'
        train.remove_wagon
      when '3'
        train.move_forward
      when '4'
        train.move_backward
      when '5'
        train.route = choosen_route
      when '6'
        edit_wagon_option
      else
        wrong_command_text
      end
    end
  end

  def edit_wagon_option(train)
    train.each_wagon do |w, i|
      if pass_wagon?(w)
        puts "Вагон № #{i}, тип: пассажирский, кол-во свободных мест: #{w.free_capacity},
          кол-во занятых мест: #{w.taken_capacity}"
      else
        puts "Вагон № #{i}, тип: грузовой, кол-во свободного объема: #{w.free_capacity},
          кол-во занятого объема: #{w.taken_capacity}"
      end
    end
    puts 'Введите номер вагона'
    wagon_index = gets.chomp.to_i
    wagon = train.wagons[wagon_index]
    is_pass_wagon = pass_wagon?(wagon)
    loop do
      if is_pass_wagon
        puts 'Введите 1, чтобы заполнить вагон'
      else
        puts 'Введите 1, чтобы занять место в вагоне'
      end
      exit_text

      choise = gets.chomp
      case choise
      when 'назад'
        break
      when '1'
        if is_pass_wagon
          wagon.take_capacity
        else
          puts 'Введите объём'
          capacity = gets.chomp.to_i
          wagon.take_capacity(capacity)
        end
      end
    end
  end

  def pass_wagon?(wagon)
    wagon.is_a? WagonPass
  end

  def pass_train?(train)
    train.is_a? TrainPass
  end

  def edit_route
    if @routes.empty?
      puts 'Вы ещё не создали ни одного маршрута'
      return
    end

    route = choosen_route

    loop do
      puts 'Введите 1, если хотите добавить станцию'
      puts 'Введите 2, если хотите удалить станцию'
      exit_text

      choise = gets.chomp

      case choise
      when 'назад'
        break
      when '1'
        route.add_station(created_station)
      when '2'
        route.show_stations_list
        puts 'Введите индекс станции, которую вы хотите удалить'
        index = gets.chomp.to_i
        route.remove_station(route.stations_list[index])
      else
        wrong_command_text
      end
    end
  end

  def edit
    loop do
      puts 'Введите 1, если хотите изменить поезд'
      puts 'Введите 2, если хотите изменить маршрут'
      exit_text

      choise = gets.chomp

      case choise
      when 'назад'
        break
      when '1'
        edit_train
      when '2'
        edit_route
      else
        wrong_command_text
      end
    end
  end

  def show
    loop do
      puts 'Введите 1, чтобы вывести список станций'
      exit_text

      choise = gets.chomp

      case choise
      when 'назад'
        break
      when '1'
        if @routes.empty?
          puts 'Вы ещё не создали ни одной станции'
          return
        end

        station_list
        puts 'Введите индекс станции, чтобы вывести список поездов'
        station_index = gets.chomp.to_i
        stations[station_index].each_train do |train|
          train_type = pass_train?(train) ? 'пассажирский' : 'грузовой'
          puts "#{train.number}, #{train_type}, #{train.wagons_count}"
        end
      else
        wrong_command_text
      end
    end
  end
end
