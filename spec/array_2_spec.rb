# frozen_string_literal: true

RSpec.describe Array do
  subject(:sally) {  [1, 2] }

  it 'caches the object within an example' do
    expect(subject.length).to eq(2)
    sally.pop(1)
    expect(subject.length).to eq(1)
  end

  it 'creates a new object for a new example' do
    expect(sally).to eq([1, 2])
  end
end
