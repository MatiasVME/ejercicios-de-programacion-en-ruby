=begin
  Crear un programa para pedido de asientos en buses, hay un máximo
  de 40 asientos. De 5 a 30 se rellenan de forma aleatoria y los
  demás se pueden rellenar de forma manual con un menú. Gracias al
  menú se puede crear pasajeros, eliminar pasajeros, mostrar
  asientos. No se puede ingresar pasajeros en asientos ya ocupados
  y no se puede eliminar pasajeros en asientos no ocupados. Use
  clases y objetos.

  El menú debe ser así:

  -----[[FuryBuses]]-----
  1) Ingresar un pasajero
  2) Eliminar un pasajero
  3) Mostrar asientos
  4) Salir
  Opción:

  El mostrar asientos se debe ver similar a esto:

  -----[[FuryBuses]]-----
  [ 1] [ 2]|   |[ 3] [ 4]
  [ *] [ *]|   |[ 7] [ 8]
  [ 9] [10]|   |[11] [12]
  [ *] [14]|   |[ *] [16]
  [17] [18]|   |[19] [20]
  [21] [22]|   |[ *] [ *]
  [ *] [26]|   |[27] [28]
  [29] [30]|   |[31] [32]
  [33] [34]|   |[35] [ *]
  [37] [38]|   |[39] [40]
=end

class Bus
  attr_reader :asientos

  def initialize
    @asientos = (1..40).to_a
    asientos_aleatorios
  end

  def asientos_aleatorios
    cant = rand * 26 + 5

    for i in 1..cant
      pos = rand * 40

      loop do
        if @asientos[pos].class == Fixnum
          @asientos[pos] = " *"
          break
        elsif @asientos[pos].class == String
          pos = rand * 40
          redo
        end
      end
    end
  end

  def ingresar_pasajero num
    if @asientos[num - 1].class == Fixnum
      @asientos[num - 1] = " *"
      return true
    else
      return false
    end
  end

  def eliminar_pasajero num
    if @asientos[num - 1].class == Fixnum
      return false
    else
      @asientos[num - 1] = num
      return true
    end
  end
end

class Menu
  attr_reader :exit

  def initialize
    @exit = false
    @bus = Bus.new
  end

  def mostrar_menu
    puts "-----[[FuryBuses]]-----"
    puts "1) Ingresar un pasajero"
    puts "2) Eliminar un pasajero"
    puts "3) Mostrar asientos"
    puts "4) Salir"
    puts "Opción:"
  end

  def opciones
    opt = gets.chomp.to_i.abs

    case opt
      when 1 then
        ingresar_pasajero
      when 2 then
        eliminar_pasajero
      when 3
        mostrar_asientos
      when 4
        @exit = true
    end
  end

  private

  def ingresar_pasajero
    print "Ingrese el numero de asiento"
    nasiento = gets.chomp.to_i

    if @bus.ingresar_pasajero nasiento
      puts "--- Pasajero ingresado ---"
    else
      puts "--- Pasajero no ingresado ---"
    end
  end

  def eliminar_pasajero
    print "Ingrese el numero de asiento"
    nasiento = gets.chomp.to_i

    if @bus.eliminar_pasajero nasiento
      puts "--- Pasajero eliminado ---"
    else
      puts "--- Pasajero no eliminado ---"
    end
  end

  def mostrar_asientos
    puts "-----[FuryBuses]-----"

    sum = 0

    for i in 0..9
      asiento1 = @bus.asientos[i+sum].class == Fixnum ? "%2d" % @bus.asientos[i+sum] : @bus.asientos[i+sum]
      asiento2 = @bus.asientos[i+sum+1].class == Fixnum ? "%2d" % @bus.asientos[i+sum+1] : @bus.asientos[i+sum+1]
      asiento3 = @bus.asientos[i+sum+2].class == Fixnum ? "%2d" % @bus.asientos[i+sum+2] : @bus.asientos[i+sum+2]
      asiento4 = @bus.asientos[i+sum+3].class == Fixnum ? "%2d" % @bus.asientos[i+sum+3] : @bus.asientos[i+sum+3]

      puts "[#{asiento1}] [#{asiento2}]|  |[#{asiento3}] [#{asiento4}]"

      sum += 3
    end
  end
end

menu = Menu.new

until menu.exit
  menu.mostrar_menu
  menu.opciones
end
