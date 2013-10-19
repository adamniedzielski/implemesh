require 'spec_helper'
require 'implemesh/generators/gaussian_noise'

describe Implemesh::Generators::GaussianNoise do

  let(:gaussian_noise_generator) { Implemesh::Generators::GaussianNoise }
  let(:amplitude) { 10 }

  it "returns a gaussian noise function" do
    signal = gaussian_noise_generator.generate(:amplitude => amplitude)
    expect(signal.mean_value).to be_within(amplitude).of(0)
  end
end