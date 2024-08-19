RSpec.describe "shorthand syntax" do
  subject { 5 }

  context "with classic syntax" do
    it "should equal 5" do
      expect(suject).to eq(5)
    end
  end

  context "with one-liner syntax" do
    it { is_expected.to eq(5)}
  end
end