require 'spec_helper'
require 'implemesh/operations/addition'

describe Implemesh::Operations::Addition do
  
  let(:addition) { Implemesh::Operations::Addition }

  before do
    @first_signal = Implemesh::Signal.new
    @first_signal.start_time = 0
    @first_signal.frequency = 1000
    @second_signal = @first_signal.dup
    @first_signal.samples = [[1, 2]]
    @second_signal.samples = [[4, 6]]
  end

  it "adds two signals" do
    result = addition.perform(@first_signal, @second_signal)
    expect(result.samples.first).to eq [5, 8]
  end
end