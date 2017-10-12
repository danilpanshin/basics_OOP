class Station

  attr_reader :stations

  def initialize(name)
    @station_name = name
    @trains = []
  end

  def arrival_train(train)
    @trains << train
  end

  def departure_train(train)
    @trains.delete(train)
  end

  def list_by_type(type)
    num = 0
    @trains.each {|traintype| num += 1 if traintype == type}
  end

end

class Route

  attr_reader :stations

  def initialize(start, finish)
    @stations = [start, finish]
  end

  def add_station(name)
    @stations.insert(@stations.length - 1, name)
  end

  def delete_station(station)
    @stations.delete(station)
  end

end

class Train

  attr_reader :speed, :wagons

  def initialize(number, type, wagons, speed = 0)
    @number = number
    @type = type
    @wagons = wagons
    @speed  = speed
  end

  def accelerate(num)
    @speed += num
  end

  def break
    @speed = 0
  end

  def take_wagon
    @wagons += 1 if @speed == 0
  end

  def leave_wagon
    @wagons -= 1 if @speed == 0 && @wagons > 0
  end

  def set_route(route)
    @route = route
    current_station.arrival_train(self)
  end

  def forward
    current_station.departure_train(self)
    @index_station += 1
    current_station.arrival_train(self)
  end

  def back
    current_station.departure_train(self)
    @index_station -= 1
    current_station.arrival_train(self)
  end

  def current_station
    @route.stations[@index_station]
  end

  def previous_station
    @route.stations[@index_station - 1]
  end

  def next_station
    @route.stations[@index_station + 1]
  end

end

