require 'spec_helper'
require 'implemesh/generators/full_rectified_sine'

describe Implemesh::Generators::FullRectifiedSine do

  let(:full_rectified_sine_generator) { Implemesh::Generators::FullRectifiedSine }

  it "returns a full rectified sine function" do
    signal = full_rectified_sine_generator.generate
    expect(signal.samples[1570].first).to be_within(0.01).of(1.0)
    expect(signal.samples[4710].first).to be_within(0.01).of(1.0)
  end
end