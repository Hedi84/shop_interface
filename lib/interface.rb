require_relative 'models/shop'
require_relative 'models/basket_promotion'
require_relative 'models/quantity_promotion'
require_relative 'models/coupon_promotion'

rules = []
rules << BasketPromotion.new(150, 20)
rules << QuantityPromotion.new({"A" => 3}, 15)
rules << QuantityPromotion.new({"B" => 2}, 5)
rules << CouponPromotion.new('freeshipping')

co = Shop.new(rules)

co.add_to_basket("C")
co.add_to_basket("A")
co.add_to_basket("D")
co.add_to_basket("A")
co.add_to_basket("A")

price = co.total
items = co.items
puts price
