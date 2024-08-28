class Actor
  def initialize(name)
    @name = name
  end

  def ready?
    sleep(3)
    true
  end

  def act
    "I love you , baby"
  end

  def fall_off_ladder
    "Call my agent! No away!"
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

actor = Actor.new("Brad Pitt")
movie = Movie.new(actor)
movie.start_shooting

#We don't care about the individual objects. We care about how they communicate with each other.
#  The only responsibility of the movie object is to talk to the actor. It's not to figure out how the actor is
# doing his job right.