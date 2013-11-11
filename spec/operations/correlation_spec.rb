require 'spec_helper'

describe Implemesh::Operations::Correlation do
  
  let(:correlation) { Implemesh::Operations::Correlation }

  prepare_signals_for_convolution_or_correlation

  it "calculates correlation using convolution" do
    result = correlation.perform(@first_signal, @second_signal)
    expect(result.real_samples).to eq [7, 20, 38, 56, 39, 20]
  end

  it "calculates correlation using the formula" do
    result = correlation.perform(@first_signal, @second_signal, false)
    expect(result.real_samples).to eq [7, 20, 38, 56, 39, 20]
  end
end