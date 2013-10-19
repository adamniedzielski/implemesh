require 'spec_helper'
require 'implemesh/generators/uniform_noise'

describe Implemesh::Generators::UniformNoise do

  let(:uniform_noise_generator) { Implemesh::Generators::UniformNoise }
  let(:amplitude) { 10 }

  it "returns a uniform noise function" do
    signal = uniform_noise_generator.generate(:amplitude => amplitude)
    expect(signal.mean_value).to be_within(amplitude).of(0)
  end
end