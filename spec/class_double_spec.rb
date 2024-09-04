#But what if we want to mock something like a class method?
# Well, for that we're going to need a complementary method that's available in our spec called Class
# Double, and it's going to operate in the exact way that the name suggests it's going to allow us to
#  mock a class, the actual class itself, not necessarily an instance of the class, but the top level
# class.
class Deck
  def self.build
    #Business logic to build a whole bunch of cards

  end
end
class CardGame
  attr_reader :cards

  def start
    @cards= Deck.build
  end
end

#So in order to do that, I'm obviously going to need a deck class.
# And of course, as you'll notice right here, this is not invoked on an instance of deck notice there's
#no dot new here. Rather we're invoking build on deck itself.
# So this represents a class method.
# So the way I can define a class method in Ruby is by prefixing the name with the word self.
# So def self dot build means this is going to exist directly on the deck class and the purpose of class
# class methods is typically to do operations that are larger than simply one object, right?
#More higher level utility operations.

RSpec.describe CardGame do
  it "can only implement class methods that are defined on a class" do
    deck_klass = class_double(Deck, build: ["Ace", "Queen"] ).as_stubbed_const
    expect(deck_klass).to receive(:build)
    subject.start
    expect(subject.cards).to eq(["Ace", "Queen"])
  end
end

#stubbed_const = So what this basically does is it ensures that whenever a deck is used throughout the example moving
#forward, it's going to replace all calls to deck with this class double.