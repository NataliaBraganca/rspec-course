# frozen_string_literal: true

# Compound expectations simply mean combining more than one expectation on a single line.
# The way we do that is by using the and or the or method.
#
RSpec.describe 25 do
  it 'can test for multiple matchers' do
    # expect(subject).to be_odd
    # expect(subject).to be > 20

    expect(subject).to be_odd.and be > 20
  end

  it { is_expected.to be_odd and be > 20 }
end

RSpec.describe 'caterpillar' do
  it 'supports multiple matchers on a single line' do
    expect(subject).to start_with('cat').and end_with('pillar')
  end

  it { is_expected.to start_with('cat').and end_with('pillar') }
end

# If you forgot the sample method in Ruby, it extracts one random value from the array.

RSpec.describe [:usa, :canada, :mexico] do
  it 'can check for multiple possibilities' do
    expect(subject.sample).to eq(:usa).or eq(:canada).or eq(:mexico)
  end
end
