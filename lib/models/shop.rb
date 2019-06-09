require_relative '../items'

class Shop
  attr_accessor :items
  attr_reader :rules

  def initialize(rules)
    @rules = rules
    @items = []
    @balance = 0
  end

  def add_to_basket(item)
    @items << item
  end

  def total
    #  basket_promotion is run after other promotions, since it could change the
    # basket value
    apply_promotions
    basket_promotion
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

  def apply_promotions
    # more promotions can be added to this if statement or separate methods can
    # be added and included in the total method to manipulate order
    @rules.each do |rule|
      if rule.class == QuantityPromotion
        num = rule.quantity_discount(@items)
        @balance -= (rule.discount * num)
      elsif rule.class == CouponPromotion
        @balance -= rule.coupon_discount(rule.couponcode)
      end
    end
  end

  def basket_promotion
    @rules.each do |rule|
      if rule.class == BasketPromotion
        total_basket = calculate_balance + @balance
        rule.basket_discount(total_basket) ? @balance -= rule.discount : nil
      end
    end
  end

end
