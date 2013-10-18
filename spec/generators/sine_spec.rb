require 'spec_helper'
require 'implemesh/generators/sine'

describe Implemesh::Generators::Sine do

  let(:sine_generator) { Implemesh::Generators::Sine.new }

  it "returns signal" do
    expect(sine_generator.generate).to be_an_instance_of Implemesh::Signal
  end

  it "returns a sine function" do
    signal = sine_generator.generate
    expect(signal.samples[1570].first).to be_within(0.01).of(1.0)
  end
end