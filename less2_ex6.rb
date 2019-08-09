#Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу
# и кол-во купленного товара (может быть нецелым числом). Пользователь может
#ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве
#названия товара. На основе введенных данных требуетеся:
# - Заполнить и вывести на экран хеш, ключами которого являются названия товаров,
#а значением - вложенный хеш, содержащий цену за единицу товара и кол-во
#купленного товара. Также вывести итоговую сумму за каждый товар.
# - Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".
basket = {}
while true
  puts "Enter the name of product"
  product = gets.chomp
  if product == "stop"
    break else
    puts "Enter the price"
    price = gets.chomp.to_i
    puts "Enter the amount"
    amount = gets.chomp.to_f
    basket[product] = Hash[price, amount]
  end
end
puts "Goods in the basket:"
puts basket
puts "Goods:"
result = 0
for i in basket.keys
  print "#{i}: "
  basket[i].each do |k, v|
    puts x = "#{k * v}"
    result += x.to_i
  end
end
puts "Total costs:"
puts result
