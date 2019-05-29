require 'rspec/autorun'
require_relative '../lib/models/basket_promotion'

describe '#basket_promotion' do
  let(:promotion) { BasketPromotion.new(200, 50) }
  it 'Reads limit' do
    expect(promotion.limit).to eq(200)
  end

  it 'Reads discount' do
    expect(promotion.discount).to eq(50)
  end

  it 'Is impossible to change limit' do
    expect{promotion.limit = 100}.to raise_error(NoMethodError)
  end

  it 'Is impossible to change discount' do
    expect{promotion.discount = 500}.to raise_error(NoMethodError)
  end

  it 'Returns true for running calculate_basket_discount 250' do
    expect(promotion.calculate_basket_discount(250)).to eq(true)
  end

  it 'Returns false for running calculate_basket_discount with 175' do
    expect(promotion.calculate_basket_discount(175)).to eq(false)
  end

end
