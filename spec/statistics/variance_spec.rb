require 'spec_helper'
require 'implemesh/signal'

describe Implemesh::Statistics::Variance do
  
  it "calculates variance for real part" do
    signal = Implemesh::Signal.new
    signal.samples = [[1, 2], [3, 4], [5, 6]]
    expect(signal.variance).to be_within(0.01).of(2.66)   
  end
end