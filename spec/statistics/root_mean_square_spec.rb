require 'spec_helper'
require 'implemesh/signal'

describe Implemesh::Statistics::RootMeanSquare do
  
  it "calculates root mean square for real part" do
    signal = Implemesh::Signal.new
    signal.samples = [[1, 2], [3, 4], [5, 6]]
    expect(signal.root_mean_square).to be_within(0.01).of(3.42)   
  end
end