require_relative 'models/checkout'
require_relative 'models/basket_promotion'
require_relative 'models/quantity_promotion'
require_relative 'models/coupon_promotion'

rules = []
rules << BasketPromotion.new(150, 20)
rules << QuantityPromotion.new({"A" => 3}, 15)
rules << QuantityPromotion.new({"B" => 2}, 5)
rules << CouponPromotion.new('freeshipping')

co = Checkout.new(rules)

co.scan("C")
co.scan("A")
co.scan("D")
co.scan("A")
co.scan("A")

price = co.total
items = co.items
puts price
