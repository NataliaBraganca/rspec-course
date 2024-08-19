RSpec.describe Hash do
  # let(:my_hash) {{}}
=begin
But as it turns out, this line is actually not necessary because our spec makes available to us a very
special method called subject, which does this for us.
So the way that subject actually works is whatever class is passed in here, subject is going to be
the equivalent of taking that class and instantiating an object from it.
=end
  it "should start off empty" do
    puts subject
    puts subject.class
    expect(subject.length).to eq(0)
    subject[:some_key] = "Some value"
    expect(subject.length).to eq(1)
  end

  it "is isolated between examples" do
    expect(subject.length).to eq(0)
  end


end

=begin
And the way subject works follows the exact same rules as a lazily instantiated variable, which means
within a single example, it's going to not continue to create a brand new hash every single time we
use subject.
Rather, it's going to use the exact same one that's been created the first time the subject method
was invoked.
But between examples, it's actually going to create a brand new hash.
So it's going to maintain isolation between different examples.
The benefit with subject, just like the benefit with let is that it is actually isolated across different
examples.
So between different examples, it remains isolated.
It is isolated between examples.
=end

=begin
But at the very beginning here, I can show you that our hash is going to go back to having exactly
zero items in it.
And the answer for this, of course, is due to the fact that this is a brand new hash.
It is not the same hash that is being used right here, because between this first example on lines
four through eight and the second example on lines 10 to 12, we're using a totally different hash object.
I'm going to repeat it a million more times Within one example, it's going to use the same object between
different examples.
It's going to lazily instantiate the next object for you to use.
=end