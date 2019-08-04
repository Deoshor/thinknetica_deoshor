puts "Введите Ваше имя?"
name = gets.chomp

puts "Введите Ваш рост?"
height = gets.chomp

ideal_weigth = height.to_i - 110

if ideal_weigth > 0
  puts "#{name}, Ваш идеальный вес #{ideal_weigth}"
else
  puts "#{name}, Ваш вес уже оптимальный!"
end
