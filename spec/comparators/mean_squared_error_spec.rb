require 'spec_helper'

describe Implemesh::Comparators::MeanSquaredError do
  
  let(:comparator) { Implemesh::Comparators::MeanSquaredError }

  prepare_signals_for_comparison

  it "calculates mean squared error" do
    result = comparator.compare(@first_signal, @second_signal)
    expect(result).to be_within(0.01).of(12.5) 
  end
end