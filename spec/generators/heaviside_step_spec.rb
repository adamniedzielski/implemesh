require 'spec_helper'
require 'implemesh/generators/heaviside_step'

describe Implemesh::Generators::HeavisideStep do

  let(:heaviside_step_generator) { Implemesh::Generators::HeavisideStep }
  let(:amplitude) { 10.0 }

  it "returns a heaviside step function" do
    signal = heaviside_step_generator.generate(:step_time => 2.0, :amplitude => amplitude)
    expect(signal.samples[10].first).to be_within(0.01).of(0.0)
    expect(signal.samples[2000].first).to be_within(0.01).of(5.0)
    expect(signal.samples[3000].first).to be_within(0.01).of(10.0)
  end
end