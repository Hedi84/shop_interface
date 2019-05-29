class BasketPromotion

  attr_reader :limit, :discount

  def initialize(limit, discount)
    @limit = limit
    @discount = discount
  end

  def calculate_basket_discount(total_price)
    total_price >= @limit ? answer = true : answer = false
    return answer
  end
end
