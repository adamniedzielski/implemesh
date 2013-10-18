require 'spec_helper'
require 'implemesh/signal'

describe Implemesh::Statistics::MeanValue do
  
  it "calculates mean value for real part" do
    signal = Implemesh::Signal.new
    signal.samples = [[1, 2], [3, 4], [5, 6]]
    expect(signal.mean_value).to eq 3.0   
  end
end