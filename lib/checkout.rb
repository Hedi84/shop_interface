class Checkout
  attr_accessor :total, :items

  ITEMS = {
    "A" => 30,
    "B" => 20,
    "C" => 60,
    "D" => 15
  }

  def initialize
    @total = 0
    @items = []
    # @rules = rules
  end

  # rules will be passed as a hash of hashes that has fixed keys for discounts
  # these can be altered and added to
  # def check_rules(@rules, @items)
  #   rules["quantity"].each do |array, value|
  #
  #   end
  # end

  def scan(item)
    @items << item
    @total += ITEMS[item]
  end

end
