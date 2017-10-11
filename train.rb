class Route

  attr_reader :stations

  def initialize(start, finish)
    @stations = [start, finish]
  end

  def add_station(name)
    @stations.insert(@stations.length - 1, name)
  end

  def list
    @stations
  end

  def delete_station(name)
    @stations.delete(name)
  end

end

class Train

  def initialize(number, type, wagons, speed = 0)
    @number = number
    @type = type
    @wagons = wagons
    @speed  = speed
  end

  def accelerate(num)
    @speed += num
    puts "скорость увеличена на #{num}км/ч"
  end

  def current_speed
    puts "текущая скорость #{speed}км/ч"
  end

  def break
    @speed = 0
  end

  def wagons_amount
    @wagons
  end

  def take_wagon
    @wagons += 1 if @speed == 0
  end

  def leave_wagon
    @wagons -= 1 if @speed == 0 && @wagons > 0
  end

  def set_route(route)

    @route = route.stations
    @index_station = 0
    puts "Поезд находится на станции #{@route.stations[@index_station]}"
  end

  def forward
    if @index_station == @route.stations.length
      puts "Конечная станция"
    else
      @index_station += 1
      puts "Поезд находится в #{@route.stations[@index_station]}"
    end
  end

  def back
    if @index_station == 0
      puts "конечная станция"
    else
      @index_station -= 1
      puts "Поезд находится в #{@route.stations[@index_station]}"
    end
  end

  def current_station
    puts "Поезд находится в #{@route.stations[@index_station]}"
  end

  def previous_station
    if @index_station == 0
      puts "конечная станция"
    else
      puts "Поезд находился в #{@route.stations[@index_station - 1]}"
    end
  end

  def next_station
    if @index_station == @route.stations.length
      puts "Конечная станция"
    else
      puts "Поезд будет находиться в #{@route.stations[@index_station + 1]}"
    end
  end

end

