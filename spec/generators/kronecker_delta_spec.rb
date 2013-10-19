require 'spec_helper'
require 'implemesh/generators/kronecker_delta'

describe Implemesh::Generators::KroneckerDelta do

  let(:kronecker_delta_generator) { Implemesh::Generators::KroneckerDelta }
  let(:amplitude) { 10.0 }

  it "returns a Kronecker delta function" do
    signal = kronecker_delta_generator.generate(:impulse_time => 2.0, :amplitude => amplitude)
    expect(signal.samples[10].first).to be_within(0.01).of(0.0)
    expect(signal.samples[2000].first).to be_within(0.01).of(10.0)
    expect(signal.samples[3000].first).to be_within(0.01).of(0.0)
  end
end