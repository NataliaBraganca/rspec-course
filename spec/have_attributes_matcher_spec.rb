# frozen_string_literal: true

# In this lesson, we'll take a look at the Have Attributes matcher, which allows us to check whether
# an object has a given set of attributes along with their values.
# So this is referring to the public interface or the public API of an object.
# It's going to check whether these attributes are available on that object and whether those values of
# those attributes evaluate to what you expect.
# But if you want to check that a given object has a set of attributes and that those attributes correspond
#  to a given set of values, you can use the have attributes matcher for that purpose.

class ProfessionalWrestler
  attr_reader :name, :finishing_move

  def initialize(name, finishing_move)
    @name = name
    @finishing_move = finishing_move
  end
end

RSpec.describe 'have_attributes matcher' do
  describe ProfessionalWrestler.new('Stone Cold Steve Austin', 'Stunner') do
    it 'checks for object attribute and proper values' do
      expect(subject).to have_attributes(name: 'Stone Cold Steve Austin')
      expect(subject).to have_attributes(name: 'Stone Cold Steve Austin', finishing_move: 'Stunner')
    end

    it { is_expected.to have_attributes(finishing_move: 'Stunner') }
    it { is_expected.to have_attributes(name: 'Stone Cold Steve Austin') }
  end
end
