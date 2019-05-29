require_relative 'models/checkout'
require_relative 'models/basket_promotion'
# require_relative 'models/checkout'
# require_relative 'models/checkout'

rules = []
rule1 = BasketPromotion.new(150, 20)
rules << rule1
co = Checkout.new(rules)

co.scan("C")
co.scan("C")
co.scan("C")
price = co.total
items = co.items
puts price
puts items
