RSpec.describe 'spies' do
  let(:animal) { spy('animal') }

  it 'confirms that a message has been received' do
    animal.eat_food
    expect(animal).to have_received(:eat_food)
    expect(animal).not_to have_received(:eat_human)
  end

  #So one important thing to note is just like a double, a spy resets between examples
  it "resets between examples" do
    expect(animal).not_to have_received(:eat_food)
  end

  it "retains the same functionality of a regular double" do
    animal.eat_food
    animal.eat_food
    animal.eat_food("Sushi")
    expect(animal).to have_received(:eat_food).with("Sushi")
    expect(animal).to have_received(:eat_food).exactly(3).times
    expect(animal).to have_received(:eat_food).at_least(2).times
    expect(animal).to have_received(:eat_food).once.with("Sushi")

  end

  #The only difference, again, is that we're not actually defining any methods on our spy itself and
  #
  # that we're writing our expectations after the fact, after the methods have been invoked.

end

#It's still acting as this fake object, but obviously two major differences.
# Number one, that we put our expectation after the actual method is invoked.
# And number two, that we never actually had to declare any of these methods, either the real ones or
# the fake ones that we wanted it to have on the actual spy.
# We just create this object that's able to dynamically accept any methods or messages that it receives.
# It doesn't matter that we didn't define eat food or eat human.
# The spy is just going to keep track of whatever it receives and then we can ask it whether it did receive
# that method or whether it did not. It's a different paradigm, a different way of thinking.
