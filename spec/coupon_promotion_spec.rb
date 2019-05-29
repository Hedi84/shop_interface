require 'rspec/autorun'
require_relative '../lib/models/coupon_promotion'

describe '#coupon_promotion' do
  let(:promotion) { CouponPromotion.new("freeshipping") }
  let(:promotion2) { CouponPromotion.new("20PERCENT") }

  it 'Expect to read couponcode' do
    expect(promotion.couponcode).to eq("freeshipping")
  end

  it 'Expect calculate_coupon_discount to give 5 discount' do
    expect(promotion.calculate_coupon_discount(150)).to eq(5)
  end

  it 'Expect calculate_coupon_discount to give 20% discount' do
    expect(promotion2.calculate_coupon_discount(200)).to eq(40)
  end

end
