# frozen_string_literal: true

RSpec.describe 'shorthand syntax' do
  subject { 5 }

  context 'with classic syntax' do
    it 'should equal 5' do
      expect(subject).to eq(5)
    end
  end

  context 'with one-liner syntax' do
    it { is_expected.to eq(5) }
  end
end
# We talked about the one liner syntax.Again, this is only available on your subject.
# So that's another big advantage of declaring a subject outside of any of your specific examples.
# It allows you to have this really quick syntax, really quick and dirty to just very quickly write yourexamples.
