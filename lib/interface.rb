require_relative 'checkout'

ITEMS = {
  "A" => 30,
  "B" => 20,
  "C" => 60,
  "D" => 15
}

co = Checkout.new({
  'quantity' => {
  ['A', 'A', 'A'] => 75,
  ['B', 'B'] => 35},
  'price' => {150 => 20}
  })

  co.scan("A")
  co.scan("B")
  price = co.total 
