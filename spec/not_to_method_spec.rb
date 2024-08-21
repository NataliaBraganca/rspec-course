#A matcher is a type of assertion or expectation or validation. So far we've really only looked at one matcher that's been eq the matcher for equality.
#the not too method checks for the inverse or the negative of a given matcher. It's the opposite effect.
# #We talked about the not to method, which is again invoked on the return value provided by the expect method.
# It checks for the inverse or the negative of whatever matcher is provided after it.

RSpec.describe "not_to method" do
  it "checks that two values do not match" do
    expect(5).not_to eq(10)
    expect("Hello").not_to eq("hello")
    expect([1, 2]).not_to eq([1, 2, 3])
  end
end