require 'spec_helper'
require 'implemesh/signal'

describe Implemesh::Statistics::MeanAbsoluteValue do
  
  it "calculates mean absolute value for real part" do
    signal = Implemesh::Signal.new
    signal.samples = [[-1, 2], [3, 4], [5, 6]]
    expect(signal.mean_absolute_value).to eq 3.0   
  end
end