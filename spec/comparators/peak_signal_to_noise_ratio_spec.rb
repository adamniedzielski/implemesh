require 'spec_helper'

describe Implemesh::Comparators::PeakSignalToNoiseRatio do
  
  let(:comparator) { Implemesh::Comparators::PeakSignalToNoiseRatio }

  prepare_signals_for_comparison

  it "calculates signal to noise ratio" do
    result = comparator.compare(@first_signal, @second_signal)
    expect(result).to be_within(0.01).of( -7.96 ) 
  end
end