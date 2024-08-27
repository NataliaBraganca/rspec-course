# frozen_string_literal: true

# And as a reminder, the not too method checks for the inverse. It checks for a negative assertion, it checks for
# a negative affirmation when, for example, you want to check the two values are not equal instead of equal.
# The not two matcher allows you to reverse an existing matcher and kind of check for the opposite.

RSpec.describe 'not_to method' do
  it 'check for the inverse of a matcher' do
    expect(5).not_to eq(19)
    expect([1, 2, 3]).not_to equal([1, 2, 3])
    expect(10).not_to be_odd
    expect([1, 2, 3]).not_to be_empty

    expect(nil).not_to be_truthy

    expect('Philadelphia').not_to start_with('car')
    expect('Philadelphia').not_to end_with('city')

    expect(5).not_to respond_to(:length)

    expect(%i[a b c]).not_to include(:d)

    expect { 11 / 3 }.not_to raise_error
  end
end
