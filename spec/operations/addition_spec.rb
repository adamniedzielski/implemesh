require 'spec_helper'
require 'implemesh/operations/addition'
require 'implemesh/signal'

describe Implemesh::Operations::Addition do
  
  let(:addition) { Implemesh::Operations::Addition }

  prepare_signals_for_basic_operations

  it "adds two signals" do
    result = addition.perform(@first_signal, @second_signal)
    expect(result.samples.first).to eq [5, 8]
  end
end