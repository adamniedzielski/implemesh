require 'spec_helper'
require 'implemesh/operations/sampling'
require 'implemesh/signal'

describe Implemesh::Operations::Sampling do
  
  let(:sampling) { Implemesh::Operations::Sampling }

  before do
    @signal = Implemesh::Signal.new
    @signal.start_time = 0
    @signal.frequency = 1000
    @signal.samples = [[1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [11, 12], [13, 14], [15, 16]]
  end

  it "creates sampled signal with desired frequency" do
    result = sampling.perform(@signal, :frequency => 500)
    expect(result.samples).to eq [[1, 2], [5, 6], [9, 10], [13, 14]]
  end
end