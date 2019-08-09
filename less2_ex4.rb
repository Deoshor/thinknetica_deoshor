#Заполнить хеш гласными буквами, где значением будет являтся порядковый номер
#буквы в алфавите (a - 1).
range_letters = ("a".."z").to_a
vowels = ["a","e","i","o","u","y"]
range_numbers = []
#создаю массив из порядковых номеров
n = 1
while n <= range_letters.size do
  range = n + 1
  range_numbers << n
  n += 1
end
#Схлопываю два массива в один ассоацитивный: буква => порядковый номер
range_zip = range_letters.zip(range_numbers)
list = Hash[*range_zip.flatten]
#Создаю массив порядковых номеров для гласных букв
num_of_vowels = list.values_at("a","e","i","o","u","y") #не смог обработатать ма
#ссив "vowels" так, чтобы при обращении через него работала эта строчка
#Схлопываю два массива: гласные и порядковые номера
numbers = vowels.zip(num_of_vowels)
puts answer = Hash[*numbers.flatten]
