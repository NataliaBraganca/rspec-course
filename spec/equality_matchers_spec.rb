# frozen_string_literal: true

RSpec.describe 'equality matchers' do
  let(:a) { 3.0 }
  let(:b) { 3 }

  describe "eq matcher" do
    it "tests for value and ignore types" do
      expect(a).to eq(3)
      expect(b).to eq(3.0)
      expect(a).to eq(b)
    end
  end
  #This is considered a totally valid syntax because when we're using EQ, the matcher tests for the value and it doesn't care about the object type.

  describe "eql matcher" do
    it "test for value, including same types" do
      expect(a).not_to eql(3)
      expect(b).not_to eql(3.0)
      expect(a).not_to eql(b)

      expect(a).to eql(3.0)
      expect(b).to eql(3)
    end

  end
end

#eql, is going to make sure that the value is correct. And if the value is completely incorrect, it really doesn't matter if the two classes are the same,
# but if the value is the same mathematically, numerically, but they're of the different data type will not consider them to be equal.
# #They must both be of the same class and of the same value in order to evaluate to true when you're using the matcher.