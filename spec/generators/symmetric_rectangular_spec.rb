require 'spec_helper'
require 'implemesh/generators/symmetric_rectangular'

describe Implemesh::Generators::SymmetricRectangular do

  let(:symmetric_rectangular_generator) { Implemesh::Generators::SymmetricRectangular }
  let(:amplitude) { 10.0 }

  it "returns a symmetric rectangular function" do
    signal = symmetric_rectangular_generator.generate(:period => 2.0, :amplitude => amplitude)
    expect(signal.samples[500].first).to be_within(0.01).of(10.0)
    expect(signal.samples[1500].first).to be_within(0.01).of(-10.0)
  end
end