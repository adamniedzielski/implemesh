require 'spec_helper'
require 'implemesh/operations/quantization'
require 'implemesh/signal'

describe Implemesh::Operations::Quantization do
  
  let(:quantization) { Implemesh::Operations::Quantization }

  before do
    @signal = Implemesh::Signal.new
    @signal.start_time = 0
    @signal.frequency = 1000
    @signal.samples = [[1, 0], [3, 0], [9, 0], [11, 0], [13, 0], [15, 0], [5, 0], [7, 0]]
  end

  it "creates quantized signal with desired number of quantization levels" do
    result = quantization.perform(@signal, 2)
    expect(result.samples).to eq [[1, 0], [1, 0], [8, 0], [8, 0], [8, 0], [8, 0], [1, 0], [1, 0]]
  end
end