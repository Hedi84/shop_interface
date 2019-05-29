class QuantityPromotion

attr_reader :discount

  def initialize(quantity_hash, discount)
    @hash = quantity_hash
    @discount = discount
  end

  def calculate_quantity_discount(items_array)
    @hash.each do |key, value|
      num = 0
      if items_array.count(key) < value
        return false
      end
    end
    return true
  end

end
