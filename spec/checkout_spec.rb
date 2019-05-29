require 'rspec/autorun'
require_relative '../lib/models/checkout'
require_relative '../lib/models/basket_promotion'
require_relative '../lib/models/quantity_promotion'
require_relative '../lib/models/coupon_promotion'

describe '#checkout' do
  let(:rules) { rule1 = BasketPromotion.new(150, 20),
  rule2 = QuantityPromotion.new({"A" => 3}, 15),
  rule3 = QuantityPromotion.new({"B" => 2}, 5) }

  let(:checkout) {Checkout.new(rules)}

  it 'Gives a total of 100 for A, B, C' do
    checkout.scan("A")
    checkout.scan("B")
    checkout.scan("C")
    expect(checkout.total).to eq(100)
  end

  it 'Gives a total of 110 for B, A, B, A, A' do
    checkout.scan("B")
    checkout.scan("A")
    checkout.scan("B")
    checkout.scan("A")
    checkout.scan("A")
    expect(checkout.total).to eq(110)
  end

  it 'Gives a total of 155 for C, B, A, A, D, A, B' do
    checkout.scan("C")
    checkout.scan("B")
    checkout.scan("A")
    checkout.scan("A")
    checkout.scan("D")
    checkout.scan("A")
    checkout.scan("B")
    expect(checkout.total).to eq(155)
  end

  it 'Gives a total of 140 for C, A, D, A, A' do
    checkout.scan("C")
    checkout.scan("A")
    checkout.scan("D")
    checkout.scan("A")
    checkout.scan("A")
    expect(checkout.total).to eq(140)
  end

  it 'gives a total of 205 for 9 times \'A\'' do
    9.times do
      checkout.scan("A")
    end
    expect(checkout.total).to eq(205)
  end

  it 'Reads items' do
    checkout.scan("A")
    expect(checkout.items).to eq(["A"])
  end

end
