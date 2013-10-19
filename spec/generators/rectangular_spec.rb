require 'spec_helper'
require 'implemesh/generators/rectangular'

describe Implemesh::Generators::Rectangular do

  let(:rectangular_generator) { Implemesh::Generators::Rectangular }
  let(:amplitude) { 10.0 }

  it "returns a rectangular function" do
    signal = rectangular_generator.generate(:period => 2.0, :amplitude => amplitude)
    expect(signal.samples[500].first).to be_within(0.01).of(10.0)
    expect(signal.samples[1500].first).to be_within(0.01).of(0.0)
  end

  context "when start time is different than zero" do

    it "takes it into account" do
      signal = rectangular_generator.generate(:period => 2.0, :amplitude => amplitude, :start_time => 1.0)
      expect(signal.samples[800].first).to be_within(0.01).of(0.0) 
    end
  end
end