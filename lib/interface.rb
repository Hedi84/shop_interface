require_relative 'models/checkout'
require_relative 'models/basket_promotion'
require_relative 'models/quantity_promotion'
require_relative 'models/coupon_promotion'

rules = []
rule1 = BasketPromotion.new(150, 20)
rules << rule1
rule2 = QuantityPromotion.new({"A" => 3}, 15)
rules << rule2
rule3 = CouponPromotion.new('freeshipping')
rules << rule3
co = Checkout.new(rules)

co.scan("A")
co.scan("A")
co.scan("A")
price = co.total
items = co.items
puts price
