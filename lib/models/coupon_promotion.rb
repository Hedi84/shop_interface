require_relative '../coupons'

class CouponPromotion

  attr_reader :couponcode

  def initialize(couponcode)
    @couponcode = couponcode
  end

  def coupon_discount(total)
    if COUPONS[@couponcode][0] == 'percentage'
      discount = (COUPONS[@couponcode][1].to_f/100) * total
    elsif COUPONS[@couponcode][0] == 'sum'
      COUPONS[@couponcode][1]
    end
  end
end
