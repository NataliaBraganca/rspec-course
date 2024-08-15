RSpec.describe Hash do
  # let(:my_hash) {{}}

  it "should start off empty" do
    puts subject
    puts subject.class
    expect(subject.length).to eq(0)
    subject[:some_key] = "Some value"
  end

  it "is isolated between examples" do
    expect(subject.length).to eq(0)
  end


end

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