class Station

  def initialize(name)
    @station_name = name
    @trains = []
  end

  def arrival_train(type)
    @trains << type
  end

  def departure_train(type)
    @trains.delete(type)
  end

  def list
    @trains.each_with_index {|type, index| puts "#{index + 1}. #{type}"}
  end

  def list_by_type(type)
    num = 0
    @trains.each {|traintype| num += 1 if traintype == type}
    puts "На станции #{num} поездов типа: #{type}"
  end

end