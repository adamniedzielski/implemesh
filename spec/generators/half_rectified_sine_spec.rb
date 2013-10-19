require 'spec_helper'
require 'implemesh/generators/half_rectified_sine'

describe Implemesh::Generators::HalfRectifiedSine do

  let(:half_rectified_sine_generator) { Implemesh::Generators::HalfRectifiedSine }


  it "returns a half rectified sine function" do
    signal = half_rectified_sine_generator.generate
    expect(signal.samples[1570].first).to be_within(0.01).of(1.0)
    expect(signal.samples[4000].first).to be_within(0.01).of(0)
  end
end