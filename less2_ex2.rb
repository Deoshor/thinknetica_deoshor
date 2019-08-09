#Заполнить массив числами от 10 до 100 с шагом 5
array = []
x = 0
while x < 10 do
  x += 5
end
while x <= 100 do
  array.push(x)
  x += 5
end
print array
