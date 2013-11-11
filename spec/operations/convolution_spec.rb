require 'spec_helper'

describe Implemesh::Operations::Convolution do

  include Implemesh::Operations::BinaryOperation
  
  let(:convolution) { Implemesh::Operations::Convolution }

  prepare_signals_for_convolution_or_correlation

  it "calculates convolution" do
    result = convolution.perform(@first_signal, @second_signal)
    expect(result.real_samples).to eq [5, 16, 34, 52, 45, 28]
  end
end