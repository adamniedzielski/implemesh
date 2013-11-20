
RSpec::Matchers.define :be_similar_array_to do |expected|
  match do |actual|
    actual.zip(expected).each do |a, e|
      expect(a).to be_within(0.1).of(e)
    end
  end
end