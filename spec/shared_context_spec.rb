# frozen_string_literal: true

RSpec.shared_context 'common' do
  before do
    @foods = []
  end

  def some_helper_method
    5
  end

  let(:some_variable) { [1, 2, 3] }
end

RSpec.describe 'first example group' do
  include_context 'common'

  it 'can use outside instance variables' do
    expect(@foods.length).to eq(0)
    @foods << 'Sushi'
    expect(@foods.length).to eq(1)
  end

  it 'can reuse instance variables across different examples' do
    expect(@foods.length).to eq(0)
  end

  it 'can use shared helper methods' do
    expect(some_helper_method).to eq(5)
  end
end

RSpec.describe 'second example in different file' do
  include_context 'common'
  it 'can use shared let variables' do
    expect(some_variable).to eq([1, 2, 3])
  end
end
=begin
Maybe objects have a similar interface, so shared examples allows us to extract the common examples
to a shared example group and shared context allows us to extract the common business logic and the
setup code to again a similar outside block that is usually declared in an external file that is then
imported.
=end