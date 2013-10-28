require 'spec_helper'
require 'implemesh/operations/zero_order_hold_reconstruction'
require 'implemesh/signal'

describe Implemesh::Operations::ZeroOrderHoldReconstruction do
  
  let(:reconstruction) { Implemesh::Operations::ZeroOrderHoldReconstruction }

  before do
    @signal = Implemesh::Signal.new
    @signal.start_time = 0
    @signal.frequency = 500
    @signal.samples = [[1, 2], [5, 6], [9, 10], [13, 14]]
  end

  it "creates sampled signal with desired frequency" do
    result = reconstruction.perform(@signal, :frequency => 1000)
    expect(result.samples).to eq [[1, 2], [1, 2], [5, 6], [5, 6], [9, 10], [9, 10], [13, 14], [13, 14]]
  end
end