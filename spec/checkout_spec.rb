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

  it 'Expect total of A, B, C to equal 100' do
    checkout.scan("A")
    checkout.scan("B")
    checkout.scan("C")
    expect(checkout.total).to eq(100)
  end

  it 'Expect total of B, A, B, A, A to equal 110' do
    checkout.scan("B")
    checkout.scan("A")
    checkout.scan("B")
    checkout.scan("A")
    checkout.scan("A")
    expect(checkout.total).to eq(110)
  end

  it 'Expect total of C, B, A, A, D, A, B to equal 155' do
    checkout.scan("C")
    checkout.scan("B")
    checkout.scan("A")
    checkout.scan("A")
    checkout.scan("D")
    checkout.scan("A")
    checkout.scan("B")
    expect(checkout.total).to eq(155)
  end

  it 'Expect total of C, A, D, A, A to equal 140' do
    checkout.scan("C")
    checkout.scan("A")
    checkout.scan("D")
    checkout.scan("A")
    checkout.scan("A")
    expect(checkout.total).to eq(140)
  end

  it 'Expect total of 9 x A to equal 205' do
    9.times do
      checkout.scan("A")
    end
    expect(checkout.total).to eq(205)
  end

end
