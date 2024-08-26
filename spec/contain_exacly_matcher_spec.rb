# frozen_string_literal: true

# Now contain exactly doesn't concern itself with the order of the elements.
# It just needs to make sure that an array has those elements in some order. If you want to check directly for order,
# you can do something like the EQ matcher to just check that the array equals an expected array that you're going to
# construct yourself. But when you really don't care about the order and you just want to check for inclusion
# of certain elements or all elements within an array you can use contain. Exactly.


RSpec.describe 'contain_exacly matcher' do
  subject { [1, 2, 3] }

  describe 'long form syntax' do
    it 'should check for the presence of all elements' do
      expect(subject).to contain_exactly(1, 2, 3)
      expect(subject).to contain_exactly(3, 2, 1)
      expect(subject).to contain_exactly(2, 1, 3)

      # expect(subject).to contain_exactly(1, 2)
      # expect(subject).to contain_exactly(1, 2, 3, 4)
    end
  end

  it { is_expected.to contain_exactly(1, 2, 3) }
  it { is_expected.to contain_exactly(3, 1, 2) }
  it { is_expected.to contain_exactly(2, 3, 1) }
end
