require_relative '../items'

class Checkout
  attr_accessor :items
  attr_reader :rules, :total

  def initialize(rules)
    @rules = rules
    @items = []
    @balance = 0
  end

  def scan(item)
    @items << item
  end


  def apply_promotions
    @rules.each do |rule|
      if rule.class == BasketPromotion
        total_basket = calculate_balance
        if rule.calculate_basket_discount(total_basket)
          @balance -= rule.discount
        end
      elsif rule.class == QuantityPromotion
        if rule.calculate_quantity_discount(@items)
          @balance -= rule.discount
        end
      elsif rule.class == CouponPromotion
        @balance -= rule.calculate_coupon_discount(rule.couponcode)
      end
    end
  end

  def total
    apply_promotions
    total = calculate_balance + @balance
    return total
  end

  private

  def calculate_balance
    total_basket = 0
    @items.each do |item|
      total_basket += ITEMS[item]
    end
    return total_basket
  end

end
