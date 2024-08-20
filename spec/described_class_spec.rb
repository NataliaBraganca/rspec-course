require 'bundler/setup'
require 'rspec'

class Prince
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

RSpec.describe Prince do
  subject { described_class.new("Boris")}
  let(:louis) { described_class.new("Louis") }

  it "has a name" do
    expect(subject.name).to eq "Boris"
    expect(louis.name).to eq "Louis"
  end
end

=begin
And that's exactly what Describe Class helps us with is we no longer have to even remember what the
name of the class is above.We only have to reference it once in a describe method, and it's simply going to instantiate that class
for us.
=end