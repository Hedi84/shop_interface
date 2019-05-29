require 'rspec/autorun'
require_relative '../lib/models/basket_promotion'

describe '#basket_promotion' do
  let(:promotion) { BasketPromotion.new(200, 50) }
  it 'Expect to read limit' do
    expect(promotion.limit).to eq(200)
  end

  it 'Expect to read discount' do
    expect(promotion.discount).to eq(50)
  end

  it 'Expect it to be impossible to change limit' do
    expect{promotion.limit = 100}.to raise_error(NoMethodError)
  end

  it 'Expect it to be impossible to change discount' do
    expect{promotion.discount = 500}.to raise_error(NoMethodError)
  end

  it 'Expect calculate_basket_discount to return true for 250' do
    expect(promotion.calculate_basket_discount(250)).to eq(true)
  end

  it 'Expect calculate_basket_discount to return false for 175' do
    expect(promotion.calculate_basket_discount(175)).to eq(false)
  end

end
