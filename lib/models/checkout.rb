require_relative '../items'

class Checkout
  attr_accessor :items
  attr_reader :rules, :total

  def initialize(rules)
    @rules = rules
    @items = []
    @total = 0
  end

  def scan(item)
    @items << item
    apply_promotions
  end

  def apply_promotions
    @rules.each do |rule|
      if rule.class == BasketPromotion
        total_basket = 0
        @items.each do |item|
          total_basket += ITEMS[item]
        end
        if rule.calculate_basket(total_basket)
          @total -= rule.discount
        end
      end
    end
  end


end
