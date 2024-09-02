class Person
  def a(seconds)
    sleep(3)
    "Hello"
    end
  end


RSpec.describe Person do
  describe "regular double" do
    it "can implement any method" do
      person = double(a: "Hello", b:20)
      expect(person.a).to eq("Hello")
    end
  end

  #A verifying double is a class or a collection of different doubles available in our spec that mimic
  # the behavior of a real life thing, either a real life class or a real instance of a class
  # And they're going to be much more stricter in their checks.
  # They're going to verify additional details in in the creation of this double.
  # So in comparison to a regular double an instance, double can only implement methods that are defined on the class.
  describe "instance double" do
    it "can only implement methods that are defined on the class" do
      # person = instance_double(Person, a: "Hello", b: 20)
      person = instance_double(Person)
      allow(person).to receive(:a).with(3).and_return("Hello")
      expect(person.a(3)).to eq("Hello")
    end
  end
end

#Instance double is another method that's available to our spec.
# You pass it the class whose instance you want to make a double of.
# And what it's going to do is verify that the API or the interface you give to your double matches the
# interface that's actually defined on your real life class and that can prevent a lot of bugs and errors
# from sneaking into your spec code.