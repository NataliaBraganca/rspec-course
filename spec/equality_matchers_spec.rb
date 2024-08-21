# frozen_string_literal: true

RSpec.describe 'equality matchers' do
  let(:a) { 3.0 }
  let(:b) { 3 }

  describe 'eq matcher' do
    it 'tests for value and ignore types' do
      expect(a).to eq(3)
      expect(b).to eq(3.0)
      expect(a).to eq(b)
    end
  end
  # This is considered a totally valid syntax because when we're using EQ, the matcher tests for the value and it doesn't care about the object type.

  describe 'eql matcher' do
    it 'test for value, including same types' do
      expect(a).not_to eql(3)
      expect(b).not_to eql(3.0)
      expect(a).not_to eql(b)

      expect(a).to eql(3.0)
      expect(b).to eql(3)
    end
  end
  # eql, is going to make sure that the value is correct. And if the value is completely incorrect, it really doesn't matter if the two classes are the same,
  # but if the value is the same mathematically, numerically, but they're of the different data type will not consider them to be equal.
  # #They must both be of the same class and of the same value in order to evaluate to true when you're using the matcher.

  describe 'equal and be matcher' do
    let(:c) { [1, 2, 3] }
    let(:d) { [1, 2, 3] }
    let(:e) { c }

    it 'cares about object identity' do
      expect(c).to eq(d)
      expect(c).to eql(d)

      expect(c).to equal(e)
      expect(c).to be(e)

      expect(c).not_to equal(d)
      expect(c).not_to equal([1, 2, 3])
    end
  end
end

# So whenever we're checking equality, we're checking that two things are equal essentially in design, Whenever we're checking identity, we're checking that two things are actually the same thing, the
# same object in memory.
# #Now, these arrays can be considered equal in the same way the houses can be considered equal, but they are not identical, just like the two houses that are built apart from each other.
# These two arrays are actually going to be stored in two totally different places of your computer's memory.
#  Ruby is going to instantiate both of these arrays and it's going to store them separately. It's not like C and D are going to be pointing to the same array.
# So identity means that it's actually the same thing, the same object in memory, While equality simply means that for all intents and purposes, the two things look the same.
# So C and D here are equal, but they are not identical, and E is both equal and identical to C, but E is not identical to D, E and D are two totally different arrays.
# E and C are the same array with two different names for it, two different addresses C and E.

# Equality checks if The two things are equal and identity that checks the two things are the same object, literally the same object in memory.
# So we have EQ, which is just the values we have, EQL, which is the values and a type. And we have equal, the full word spelled out which checks for identity and equal is the same thing as be.

#== e eql? comparam o valor ou conteúdo dos objetos.
# equal? compara a identidade do objeto, verificando se são exatamente a mesma instância.

# eq = checks only value
# eql = checks value and type
# equal = object identity
#
