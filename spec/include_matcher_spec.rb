# frozen_string_literal: true

# include matcher, which allows us to check whether an object includes something else.
#  For example, we can check if a string includes a substring or check if an array includes a given value,
# or even check if a hash includes a specific key value pair.
# when it comes to strings include is going to look for a substring.
# when it comes to an array The include matcher is going to look for one or more elements within that array in any order.
# And when it comes to a hash, the include match is going to look for either a key or a key value pair or any number
# of keys or key value pairs.

RSpec.describe 'include_matcher' do
  describe 'hot chocolate' do
    it 'checks for substrings' do
      expect(subject).to include('hot')
      expect(subject).to include('choc')
      expect(subject).to include('late')
    end

    it { is_expected.to include('choc') }
  end

  describe [10, 20, 30] do
    it 'checks for inclusion in the array, regardless of order' do
      expect(subject).to include(10)
      expect(subject).to include(10, 20)
      expect(subject).to include(30, 20)
    end

    it { is_expected.to include(20, 30, 10) }
  end

  describe({ a: 2, b: 4 }) do
    it 'can check for a key existence' do
      expect(subject).to include(:a)
      expect(subject).to include(:a, :b)
      expect(subject).to include(:b, :a)
    end

    it 'can check for key-value pairs' do
      expect(subject).to include(a: 2)
    end

    it { is_expected.to include(:b) }
    it { is_expected.to include(b: 4) }
  end
end
