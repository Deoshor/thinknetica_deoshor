#Заданы три числа, которые обозначают число, месяц, год
#(запрашиваем у пользователя). Найти порядковый номер даты, начиная отсчет с
#начала года. Учесть, что год может быть високосным. (Запрещено использовать
#встроенные в ruby методы для этого вроде Date#yday или Date#leap?)
#Алгоритм опредления високосного года: www.adm.yar.ru
puts "Enter the day"
day = gets.chomp.to_i
puts "Enter the month (for example, january)"
month = gets.chomp
puts "Enter the year"
year = gets.chomp.to_i
months = {
  "january" => 31,
  "febraury" => 28,
  "march" => 31,
  "april" => 30,
  "may" => 31,
  "june" => 30,
  "july" => 31,
  "august" => 31,
  "september" => 30,
  "october" => 31,
  "november" => 30,
  "december" => 31,
  }
#Проверка високосного года
months["febraury"] = 29 if year % 4 == 0 || year % 400 == 0
#Подсчет дней до текущей даты
res = 0
months.keys.each do |key|
  if months[key] != month
    res += months[key]
    break else
  end
end
res += day.to_i
puts res
#Не выходит с .each. Я полтора вечера просидел продумал как с .each сделать и
# не вышло у меня, решил через for сделать. Сейчас ответ неправильный выдает
# этот .each

=begin
for i in months.keys
  if i != month
    res += months[i]
  else break
  end
end
=end
#res += day.to_i
puts res
