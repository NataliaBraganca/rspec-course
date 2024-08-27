# frozen_string_literal: true

# which check that a given object either begins or concludes with one or more values.

RSpec.describe 'start_with_and_end_with_matchers' do
  describe 'caterpillar' do
    it 'should check for a substring at the beginning or end' do
      expect(subject).to start_with('cat')
      expect(subject).to end_with('pillar')
    end

    it { is_expected.to start_with('cat') }
    it { is_expected.to end_with('pillar') }
  end

  describe [:a, :b, :c, :d] do
    it 'should  check for elements at beginning or end of the array' do
      expect(subject).to start_with(:a)
      expect(subject).to start_with(:a, :b)
      expect(subject).to start_with(:a, :b, :c)
      expect(subject).to end_with(:d)
      expect(subject).to end_with(:c, :d)
    end

    it { is_expected.to start_with(:a, :b) }
  end
end

# These start with and end with matchers, which check for specific values at the beginning or end of a given object.
#  In the case of strings, they're simply going to look for a substring at the beginning or end of that string.
# And in the case of arrays or spec is going to look for values at the beginning of the array or towards the end of the array.
