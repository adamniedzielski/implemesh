require 'spec_helper'

describe Implemesh::Operations::Filtering do
  
  let(:filtering) { Implemesh::Operations::Filtering }

  before do
    @signal = Implemesh::Signal.new
    @signal.start_time = 0
    @signal.frequency = 1000
    @signal.samples = 20.times.map { [rand(-1.0 .. 1.0), 0] }
  end

  context "low pass filtering" do

    it "creates signal with smaller variance" do
      result = filtering.perform(@signal, :cutoff_frequency => 1, :coefficients => 5)
      expect(result.variance).to be <= @signal.variance
    end
  end

  context "with window function" do

    it "works" do
      result = filtering.perform(@signal, :blackman_window => true)
    end
  end

  context "bandpass filtering" do

    it "works" do
      result = filtering.perform(@signal, :bandpass => true)
    end
  end
end