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
if year % 4 == 0 || year % 400 == 0 || year == 2000
  months["febraury"] = 29
else
  months["febraury"] = 28
end
#Подсчет дней до текущей даты
res = 0
for i in months.keys
  if i != month
    res += months[i]
  else break
  end
end
res += day.to_i
puts res
