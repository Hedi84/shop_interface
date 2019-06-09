require 'rspec/autorun'
require_relative '../lib/models/shop'
require_relative '../lib/models/basket_promotion'
require_relative '../lib/models/quantity_promotion'
require_relative '../lib/models/coupon_promotion'

describe '#shop' do
  let(:rules) { rule1 = BasketPromotion.new(150, 20),
  rule2 = QuantityPromotion.new({"A" => 3}, 15),
  rule3 = QuantityPromotion.new({"B" => 2}, 5) }

  let(:shop) {Shop.new(rules)}

  it 'Gives a total of 100 for A, B, C' do
    shop.add_to_basket("A")
    shop.add_to_basket("B")
    shop.add_to_basket("C")
    expect(shop.total).to eq(100)
  end

  it 'Gives a total of 110 for B, A, B, A, A' do
    shop.add_to_basket("B")
    shop.add_to_basket("A")
    shop.add_to_basket("B")
    shop.add_to_basket("A")
    shop.add_to_basket("A")
    expect(shop.total).to eq(110)
  end

  it 'Gives a total of 155 for C, B, A, A, D, A, B' do
    shop.add_to_basket("C")
    shop.add_to_basket("B")
    shop.add_to_basket("A")
    shop.add_to_basket("A")
    shop.add_to_basket("D")
    shop.add_to_basket("A")
    shop.add_to_basket("B")
    expect(shop.total).to eq(155)
  end

  it 'Gives a total of 140 for C, A, D, A, A' do
    shop.add_to_basket("C")
    shop.add_to_basket("A")
    shop.add_to_basket("D")
    shop.add_to_basket("A")
    shop.add_to_basket("A")
    expect(shop.total).to eq(140)
  end

  it 'gives a total of 205 for 9 times \'A\'' do
    9.times do
      shop.add_to_basket("A")
    end
    expect(shop.total).to eq(205)
  end

  it 'Reads items' do
    shop.add_to_basket("A")
    expect(shop.items).to eq(["A"])
  end

end
