require_relative 'checkout'


# rules will be passed as a hash of hashes that has fixed keys for different
# types of discounts, these can be altered and added to.
co = Checkout.new

co.scan("A")
co.scan("B")
price = co.total
items = co.items
puts price
puts items
