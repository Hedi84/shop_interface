class Checkout
  attr_accessor :total, :items

  def initialize(rules)
    @total = 0
    @items = []
    @rules = rules
  end

  def check_rules(items)

  end

  def scan(item)
  end

end
