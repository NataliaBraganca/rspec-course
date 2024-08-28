# frozen_string_literal: true

# A double is a mock object that stands in for a real object in a test suite.
# Well, to mock means to emulate something or to replace a real thing with a simulated version of it.
# We're going to be talking about a new method in R-spec called the double. And what a double creates for us is a test double.
# And a test double is basically just an object that can respond to any variety of methods that we define on it.

# So as a reminder, whenever you're passing in a hash as the last argument to a Method invocation.
# In Ruby, you do not have to provide the curly braces that begin the hash, but you are more than welcome to include
# those if you see fit.

# So what this means right now is I've defined a method called fall off ladder that's going to be available on my object.
# And whenever I invoke fall off ladder, I'm going to get back the return value. Ouch.

RSpec.describe 'a random double' do
  it 'only allows defined methods to be invoked' do
    # stuntman = double('Mr. Danger', fall_off_ladder: 'Ouch', light_on_fire: true)

    # expect(stuntman.fall_off_ladder).to eq('Ouch')
    # expect(stuntman.light_on_fire).to eq(true)

    # stuntman = double('Mr. Danger')
    # allow(stuntman).to receive(:fall_off_ladder).and_return('Ouch')
    # expect(stuntman.fall_off_ladder).to eq('Ouch')

    stuntman = double('Mr. Danger')
    allow(stuntman).to receive_messages(fall_off_ladder: 'Ouch', light_on_fire: true)
    expect(stuntman.fall_off_ladder).to eq('Ouch')
    expect(stuntman.light_on_fire).to eq(true)
  end
end

# So I'm going to go ahead and wrap this in an expect statement because Stuntman is now a valid object and fall off
# ladder is now a valid method on that object.And I'm going to expect that when I invoke that method on this double
# on this object that I've created, I obviously should get the string back out.

# We have successfully created an object, number one. And number two, we have successfully given it methods.
# And number three, we have successfully defined the return values for those methods. Right?
#  We don't need to define a class to do this right. We don't need to define some complexity.
# We can literally use our specs double feature to create this object for us that can basically conform
# to whatever methods we want it to have.
