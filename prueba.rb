opcion = 0
# 1
def bla()

end

# 2
def bla()

end

# 3
def bla()

end

while opcion != 4
  puts 'Elige una opción'
  puts ''
  puts 'Ingresa 2 para '
  puts 'Ingresa 3 para '
  puts 'Ingresa 4 para'
  opcion = gets.chomp

  puts case opcion
  when '1'
    bla()
  when '2'
    bla()
  when '3'
    bla()
  else
    exit
  end
end