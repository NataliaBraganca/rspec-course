#We're going to add an additional method here called width.
#And width is going to allow us to specify exactly what argument we expect to get and what to return.
# In the case of that argument being provided to the method invocation.

RSpec.describe 'matching arguments' do
  it 'can return different values depending on the argument' do
    three_element_array = double

    allow(three_element_array).to receive(:first).with(no_args).and_return(1)
    allow(three_element_array).to receive(:first).with(1).and_return([1])
    allow(three_element_array).to receive(:first).with(2).and_return([1, 2])
    allow(three_element_array).to receive(:first).with(be >=3).and_return([1, 2, 3])

    expect(three_element_array.first).to eq(1)
    expect(three_element_array.first(1)).to eq([1])
    expect(three_element_array.first(2)).to eq([1, 2])
    expect(three_element_array.first(3)).to eq([1, 2, 3])
    expect(three_element_array.first(100)).to eq([1, 2, 3])
  end
end
#I want to allow my three element array double to receive the first method with any argument that is
# greater than or equal to three. The argument must be greater than or equal to three, which qualifies three,
# four, five, six, seven all the way up to whatever is the maximum positive number available in Ruby.
#Again, this is not the number of arguments. (with(2)) This is the actual value of the first argument.