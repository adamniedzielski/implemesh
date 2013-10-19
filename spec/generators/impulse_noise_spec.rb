require 'spec_helper'
require 'implemesh/generators/impulse_noise'

describe Implemesh::Generators::ImpulseNoise do

  let(:impulse_noise_generator) { Implemesh::Generators::ImpulseNoise }
  let(:amplitude) { 10 }

  it "returns a impulse noise function" do
    signal = impulse_noise_generator.generate(:amplitude => amplitude)
    expect(signal.samples.max_by(&:first).first).to be <= amplitude
    expect(signal.samples.min_by(&:first).first).to be >= 0 
  end
end