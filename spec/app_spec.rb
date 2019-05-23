require 'app'

describe '#greet' do

  it 'should return a string' do
      response = greet("hello")
      expect(response).to be_a String
  end

end
