require_relative 'items'

class Checkout
  attr_accessor :total, :items


  def initialize
    @total = 0
    @items = []
  end


  def scan(item)
    @items << item
    @total += ITEMS[item]
  end

end
