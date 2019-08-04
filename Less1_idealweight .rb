puts "Введите Ваше имя?"
name = gets.chomp

puts "Введите Ваш рост?"
height = gets.chomp

height_int = height.to_i

if height_int - 110 > 0
  puts "#{name}, Ваш идеальный вес #{height_int - 110}"
else
  puts "#{name}, Ваш вес уже оптимальный!"
end

=begin
Возможно последнее условие не совсем корректное, при карликовом росте 1 метр
получается вес у карлика оптимальный в любом случае :)
=end
