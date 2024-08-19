# frozen_string_literal: true

RSpec.describe Hash do
  subject(:bob) do
    { a: 1, b: 2 }
  end

  it 'has two key-value pairs' do
    expect(subject.length).to eq(2)
    expect(bob.length).to eq(2)
  end

  describe 'nexted example' do
    it 'has two key-value pairs' do
      expect(subject.length).to eq(2)
      expect(bob.length).to eq(2)
    end
  end
  describe 'nexted example 2' do
    subject(:jake) do
      { a: 1, b: 2, c: 3 }
    end
    it 'has tree key-value pairs' do
      expect(subject.length).to eq(3)
      expect(jake.length).to eq(3)
    end
  end
end

# However, the advantages of using subject in this approach with explicitly is that you can customize
# exactly what the instance represents, which also gives you access to some short line shorthand syntax
# options that we're going to explore a little bit later in the course.
# And again, subject is just an alternative to let.
# There are many different ways to solve the same problem in Ruby and in our spec.
