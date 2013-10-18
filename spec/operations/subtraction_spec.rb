require 'spec_helper'
require 'implemesh/operations/subtraction'
require 'implemesh/signal'

describe Implemesh::Operations::Subtraction do
  
  let(:subtraction) { Implemesh::Operations::Subtraction }

  prepare_signals_for_basic_operations

  it "subtracts two signals" do
    result = subtraction.perform(@first_signal, @second_signal)
    expect(result.samples.first).to eq [-3, -4]
  end
end