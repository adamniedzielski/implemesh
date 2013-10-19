require 'spec_helper'
require 'implemesh/signal'

describe Implemesh::Statistics::AveragePower do
  
  it "calculates average power for real part" do
    signal = Implemesh::Signal.new
    signal.samples = [[1, 2], [3, 4], [5, 6]]
    expect(signal.average_power).to be_within(0.01).of(11.67)   
  end
end