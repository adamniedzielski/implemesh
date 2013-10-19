require 'spec_helper'
require 'implemesh/generators/triangular'

describe Implemesh::Generators::Triangular do

  let(:triangular_generator) { Implemesh::Generators::Triangular }
  let(:amplitude) { 10.0 }

  it "returns a triangular function" do
    signal = triangular_generator.generate(:period => 2.0, :amplitude => amplitude)
    expect(signal.samples[1000].first).to be_within(0.01).of(10.0)
    expect(signal.samples[1500].first).to be_within(0.01).of(5.0)
  end
end