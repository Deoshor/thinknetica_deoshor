puts "Введите длину основания треугольника в сантиметрах"
basis = gets.chomp

puts "Введите высоту треугольника в сантиметрах"
height = gets.chomp

puts "При длине основания a = #{basis} см и высоте h = #{height} см
площадь треуголька равна S = #{(0.5 * basis.to_i * height.to_i).to_i} см"
