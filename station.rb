class Station

  attr_accessor :number_of_trains, :station_name, :number_cargo, :number_of_pass

  def initialize(name)
    @station_name = name
    @number_of_trains = 0
    @number_of_pass = 0
    @number_cargo = 0
  end

  def arrival_train(type)
    @number_of_trains += 1
    if type == "cargo"
      @number_cargo += 1
    elsif type == "passanger"
      @number_of_pass += 1
    end
  end

  def departure_train(type)
    @number_of_trains -= 1
    if type == "cargo"
      @number_cargo -= 1
    elsif type == "passanger"
      @number_of_pass -= 1
    end
  end

  def list
    puts "На станции #{station_name} находится всего #{number_of_trains} поездов. Их них #{number_cargo} грузовых и #{number_of_pass} пассажирских"
  end

end