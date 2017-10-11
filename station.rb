class Station

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

  def list
    @trains
  end

  def list_by_type(type)
    num = 0
    @trains.each {|traintype| num += 1 if traintype == type}
    puts "На станции #{num} поездов типа: #{type}"
  end

end