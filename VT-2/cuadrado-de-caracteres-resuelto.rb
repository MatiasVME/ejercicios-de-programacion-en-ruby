=begin
  Crear un programa al cual se le diga por teclado un caracter y un número,
  a partir de ese caracter y ese numero cree una cuadrado de caractere.

  Por ejemplo si le pasamos la el asterisco * y el numero 4 muestre lo siguiente
  como resultado:

****
*  *
*  *
****

=end

print "Ingrese el caracter: "
c = gets.chomp[0]

print "Ingrese el tamaño el cuadrado: "
tam = gets.chomp.to_i.abs

recorrido = 1..tam

for i in recorrido
  if i == recorrido.first or i == recorrido.last
    puts c * tam
  else
    puts c + " " * (tam - 2) + c
  end
end
