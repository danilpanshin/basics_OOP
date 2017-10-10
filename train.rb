class Route
$arr
  def initialize(start, finish)
    @first_station = start
    @last_station = finish
    $arr = [@first_station, @last_station]
  end

  def add_station(name)
    $arr.insert($arr.length - 1, name)
  end

  def list
    puts "#{$arr.each_with_index {|x,y |puts "#{y+1}. #{x}"}}"
  end

  def delete(name)
    $arr.delete(name)
  end
end

class Train < Route

attr_accessor :number, :type, :wagons, :speed

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
    wagons
  end

  def take_wagon
    if @speed == 0
      @wagons += 1
    else
      puts "сначала нужно остановиться"
    end
  end

  def leave_wagon
    if @speed == 0
      @wagons -= 1
    else
      puts "сначала нужно остановиться"
    end
  end

  def list
    puts "Маршрут поезда:"
    super
    @i = 0
    puts "Поезд находится в #{$arr[@i]}"
  end

  def forward
    if @i == $arr.length
      puts "Конечная станция"
    else
      @i += 1
      puts "Поезд находится в #{$arr[@i]}"
    end
  end

  def back
    if @i == 0
      puts "конечная станция"
    else
      @i -= 1
      puts "Поезд находится в #{$arr[@i]}"
    end
  end

  def current_station
    puts "Поезд находится в #{$arr[@i]}"
  end

  def previous_station
    if @i == 0
      puts "конечная станция"
    else
      puts "Поезд находился в #{$arr[@i - 1]}"
    end
  end
  def next_station
    if @i == $arr.length
      puts "Конечная станция"
    else
    puts "Поезд будет находиться в #{$arr[@i + 1]}"
    end
  end

end

