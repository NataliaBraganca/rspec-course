# frozen_string_literal: true

# The idea behind polymorphism is that we as developers shouldn't care so much about what object we're dealing with, what what class it comes from.
# What we care more about is what an object can respond to, what methods that it has on it, what messages
# it can accept and return values for.
# So the point of the respond to matcher, which we'll talk about in this lesson, is checking that an
# object can respond to a given method. We don't even care about what the return value of that method is.
# We don't care about what it does. We just care that the object has an interface that has that method,
# that it can receive that message and process it right

class HotChocolate
  def drink
    'Delicious'
  end

  def discard
    'PLOP!'
  end

  def purchase(number)
    "Awesome, I just purchased #{number} more hot chocolate beverages!"
  end
end

RSpec.describe HotChocolate do
  it 'confirms that an object can respond to a method' do
    expect(subject).to respond_to(:drink)
    expect(subject).to respond_to(:drink, :discard)
    expect(subject).to respond_to(:drink, :discard, :purchase)
  end
  # So all we're checking here is we don't even care what purchases method signature is.
  # We don't care if it expects one argument or two arguments.
  # We're literally just checking that a hot chocolate instance has a method called purchase.

  it 'confirms an object can respond to a method with arguments' do
    expect(subject).to respond_to(:purchase)
    expect(subject).to respond_to(:purchase).with(1).arguments
  end

  it { is_expected.to respond_to(:purchase, :discard) }
  it { is_expected.to respond_to(:purchase).with(1).argument }
end
