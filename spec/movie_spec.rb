# frozen_string_literal: true

class Actor
  def initialize(name)
    @name = name
  end

  def ready?
    sleep(3)
    true
  end
  # So all the double can do is just automatically return true and simulate the behavior of an actor without
  # actually going through the complexity of instantiating that class and going through all of its business logic.

  def act
    'I love you , baby'
  end

  def fall_off_ladder
    'Call my agent! No away!'
  end

  def light_on_fire
    false
  end
end

class Movie
  attr_reader :actor

  def initialize(actor)
    @actor = actor
  end

  def start_shooting
    if actor.ready?
    actor.act
    actor.fall_off_ladder
    actor.light_on_fire
    end
  end
end

# actor = Actor.new("Brad Pitt")
# movie = Movie.new(actor)
# movie.start_shooting
# We don't care about the individual objects. We care about how they communicate with each other.
#  The only responsibility of the movie object is to talk to the actor. It's not to figure out how the actor is
# doing his job right.

# So what my goal is here is to use a double to simulate an actor object. I'm not going to use a real actor object for
# several reasons. One, because it creates dependency.
# And if something goes wrong in my spec, I'm not going to know whether it's coming from the movie class or the actor class.
# And two, because the actor class can actually be pretty heavy.

RSpec.describe Movie do
  let(:stuntman) do
    double('Mr. Danger', ready?: true, act: 'Any string at all', fall_off_ladder: 'Sure! Lets do it',
                         light_on_fire: true)
  end
  subject { described_class.new(stuntman) }

  describe '#start_shooting' do
    it 'expects an actor tod do 3 actions' do
      expect(stuntman).to receive(:ready?)
      expect(stuntman).to receive(:act)
      expect(stuntman).to receive(:fall_off_ladder)
      expect(stuntman).to receive(:light_on_fire)
      subject.start_shooting
    end
  end
end

#We created a stuntman double that had the exact same public interface as our valid actor object.
# We then passed that double object in to our initialize method for our movie, so we allowed our double
# to take the place of a real life actor object and skip over all the complexities that make an actor,
#  an actor skip over all the complex business logic and the internal implementations in favor of simply
#  having an object to just give us automatic return values.
# This speeds up the specs and it creates a wall of separation between the movie class and the actor class.
# So now the movie class can simply test itself.
# It can assume it's going to have an actor or an actor like object that's going to respond to a certain method.
# And all we tested is that when we call the movie's interface, which is start shooting, that it talks
# successfully to that actor and gives it the proper commands and lets the actor take care of that logic.
# That is the only responsibility that the movie has.