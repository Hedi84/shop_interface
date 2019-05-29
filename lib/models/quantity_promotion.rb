class QuantityPromotion

attr_reader :discount

  def initialize(quantity_hash, discount)
    @hash = quantity_hash
    @discount = discount
  end

  def calculate_quantity_discount(items_array)
    answer = nil
    @hash.each do |key, value|
      if items_array.count(key) < value
        answer = 0
      else
        number = items_array.count(key) / value
        answer = number.floor
      end
    end
    return answer
  end

end
