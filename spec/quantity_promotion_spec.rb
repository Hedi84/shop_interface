require 'rspec/autorun'
require_relative '../lib/models/quantity_promotion'

describe '#quantity_promotion' do
  let(:promotion) { QuantityPromotion.new({"D" => 4}, 50) }

  it 'Expect to be unable to read quantity hash' do
    expect{promotion.quantity_hash}.to raise_error(NoMethodError)
  end

  it 'Expect to read discount' do
    expect(promotion.discount).to eq(50)
  end

  it 'Expect it to be impossible to change discount' do
    expect{promotion.discount = 400}.to raise_error(NoMethodError)
  end

  it 'Expect calculate_quantity_discount to return 1 for 4 \'D\' items' do
    expect(promotion.calculate_quantity_discount(['D', 'D', 'D', 'D'])).to eq(1)
  end

  it 'Expect calculate_quantity_discount to return 0 for array without 4 \'D\' items' do
    expect(promotion.calculate_quantity_discount(['D', 'A', 'D', 'B'])).to eq(0)
  end

end
