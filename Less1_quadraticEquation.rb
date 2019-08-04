puts "Введите коэффициент уравнения 'a':"
a = gets.chomp

puts "Введите коэффициент уравнения 'b':"
b = gets.chomp

puts "Введите коэффициент уравнения 'c':"
c = gets.chomp

d = (b.to_i**2) - (4 * a.to_i * c.to_i)
puts "Дискриминант уравнения равен: #{d}"

  if d > 0
    rootd = Math.sqrt(d)
    x1 = (rootd - (b.to_i))/2 * a.to_i
    x2 = (rootd - (-b.to_i))/2 * a.to_i
    puts "Первый корень уравнения равен: #{x1.to_i}"
    puts "Второй корень уравнения равен: #{x2.to_i}"
  elsif d == 0
    x = (-b.to_i)/2 * a.to_i
    puts "Корни уравнения равны: #{x.to_i}"
  else
    puts "Корней нет"
  end
