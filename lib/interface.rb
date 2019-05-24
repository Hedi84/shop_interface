require_relative 'checkout'



# co = Checkout.new({
#   "quantity" => {
#   ["A", "A", "A"] => 75,
#   ["B", "B"] => 35},
#   "price" => {150 => 20}
# })

co = Checkout.new
co.scan("A")
co.scan("B")
price = co.total
puts price
