# frozen_string_literal: true

# allows us to actually create our very own assertions, our very
# own expectations. We can now use this satisfy matcher to check for a custom condition to be met.

RSpec.describe 'satisfy_matcher' do
  # subject { 'racecar' }
  subject { 'racecars' }

  it 'is a palindrome' do
    expect(subject).to satisfy { |value| value == value.reverse }
  end

  it 'can accept a custom error message' do
    expect(subject).to satisfy('be a palindrome') do |value|
      value == value.reverse
    end
  end
end

# We talked about the satisfy matcher.
#  This will allow us to create whatever custom assertions or expectations you want in Ruby and spec.
# So if there's something that's missing from the R spec library, you can obviously hound them on GitHub and
# annoy them or you can define something that fits your custom business needs.

# All you have to do is use the two method, provide the satisfy matcher, give it a string argument that
#  describes the business logic of what you expect to be or to happen or to exist.
#  And then to the block you write your own custom set of implementation logic, and this doesn't have
#  to be a one liner.
# Obviously this can be a much more complex operation.
# You can pass this object in to another object that transforms it, that passes it to another object
# that finally returns you a value that is either a true or false.
