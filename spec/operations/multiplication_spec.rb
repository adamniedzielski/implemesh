require 'spec_helper'
require 'implemesh/operations/multiplication'
require 'implemesh/signal'

describe Implemesh::Operations::Multiplication do
  
  let(:multiplication) { Implemesh::Operations::Multiplication }

  prepare_signals_for_basic_operations

  it "adds two signals" do
    result = multiplication.perform(@first_signal, @second_signal)
    expect(result.samples.first).to eq [4, 12]
  end
end