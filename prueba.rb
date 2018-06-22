lineas = []
File.open('notas.csv', 'r') { |file| lineas = file.readlines.each.map(&:chomp) }

# variables
option = 0
notaminima = 5.0

# 1
def crea_promedio(lineas)
  file = File.new('promedio.txt', 'w')
  lineas.each do |item|
    nombre = item.split(', ')[0]
    notas = item.split(', ')[1..5].each.map(&:to_i)
    suma = 0
    notas.each { |nota| suma += nota }
    promedio = suma.to_f / notas.length
    file.puts "El promedio de #{nombre} es: #{promedio}"
  end
  file.close
  puts 'Se genero un archivo con los promedios'
end

# 2
def inasistencia_total(lineas)
  lineas.each do |item|
    nombre = item.split(', ')[0]
    notas = item.split(', ')[1..5].each.map(&:to_i) # 0 = eran "A"
    total = notas.count(0)
    puts "#{nombre} tiene #{total} inasistencias" if notas.count(0) >= 1
  end
  return nil
end

# 3
def alumnos_aprobados(lineas, notaminima) 
  puts 'Ingrese nota minima de aprobación'
  notaminima = gets.chomp.to_f

  lineas.each do |item|
    nombre = item.split(', ')[0]
    notas = item.split(', ')[1..5].each.map(&:to_i)
    suma = 0
    notas.each { |nota| suma += nota }
    promedio = suma.to_f / notas.length
      puts "#{nombre} aprobado con nota #{promedio}" if promedio >= notaminima
  end
  return nil
end

# menu
while option != 4
  puts '----------------'
  puts 'Elige una opción'
  puts 'Ingresa 1 para generar promedios'
  puts 'Ingresa 2 para ver inasistencias'
  puts 'Ingresa 3 para ver almunos aprobados'
  puts 'Ingresa 4 para salir'
  option = gets.chomp

  puts case option
       when '1'
         crea_promedio(lineas)
       when '2'
         inasistencia_total(lineas)
       when '3'
         alumnos_aprobados(lineas, notaminima)
       when '4'
         exit
       else
         puts 'Ingresa una opción valida'
       end
end
