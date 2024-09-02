RSpec.describe 'allow method review' do
  it 'can customize return value for methods on doubles' do
    calculator = double
    allow(calculator).to receive(:add).and_return(15)

    expect(calculator.add).to eq(15)
    expect(calculator.add(3)).to eq(15)
    expect(calculator.add(-2, -3, -5)).to eq(15)
    expect(calculator.add('hello')).to eq(15)
  end

  it 'can stub one or more methods on a real object' do
    arr = [1, 2, 3]
    allow(arr).to receive(:sum).and_return(10)

    expect(arr.sum).to eq(10)

    arr.push(4)
    expect(arr).to eq([1, 2, 3, 4])
  end

  it 'can return multiple return values in sequence' do
    mock_array = double
    allow(mock_array).to receive(:pop).and_return(:c, :b, nil)
    expect(mock_array.pop).to eq(:c)
    expect(mock_array.pop).to eq(:b)
    expect(mock_array.pop).to be_nil
  end
end

#We can pass in either a ruby double as we did in the first and third examples, or even a real ruby
#object like an array or a hash or a string or really anything in your, in your business logic, anything
# in your specific application, you can pass that into the allow method.
# Then call the two receive method to define what symbol you want to add or what method you want to add
# or modify on the double or on the Ruby object.
# And then of course provide one or more return values that the double will give back to you whenever
# that method is invoked on that given object.