=begin
  Crear un rombo de caracteres a partir de un número, ese número tiene que
  ser apto para crear el rombo, por ejemplo 3, 5, 7, 9 que definen la altura
  en caracteres del rombo.

Si se le pasa 3

 *
* *
 *

Si se le pasa 5

  *
 * *
*   *
 * *
  *

Si se le pasa 7

   *
  * *
 *   *
*     *
 *   *
  * *
   *

Si se le pasa 9

    *
   * *
  *   *
 *     *
*       *
 *     *
  *   *
   * *
    *
=end

def crear_rombo altura
  c = "*"
  sum = 0

  for i in 1..altura
    if i == 1 || i == altura
      puts " " * (altura / 2) + c
    elsif i <= altura / 2 + 1
      puts " " * (altura - altura / 2 - i) + c + " " * (2 * i + -3) + c
    elsif i <= altura - 1
      sum += 1
      puts " " * sum + c + "-" * sum2
    end
  end
end

puts "Ingrese el tamaño del rombo: "
tam = gets.to_i
crear_rombo tam
