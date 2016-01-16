=begin
  Crear un programa al cual se le diga por teclado un caracter y un número,
  a partir de ese caracter y ese numero cree una piramide de caracteres.

  Por ejemplo si le pasamos la el asterisco * y el numero 3 muestre lo siguiente
  como resultado:

    *
   ***
  *****
=end

puts "Ingrese el caracter de la piramide"
c = gets.chomp[0]

puts "Ingrese el tamaño de la piramide"
tam = gets.chomp.to_i.abs

valor = c

for i in 1..tam
    puts " " * (tam - i) + valor
    valor += c * 2
end
