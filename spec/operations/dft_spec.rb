require 'spec_helper'

describe Implemesh::Operations::DFT do
  
  let(:dft) { Implemesh::Operations::DFT }
  let(:before_fourier) { [[5, 0], [3, 0], [1, 0], [2, 0], [5, 0], [6, 0], [1, 0], [9, 0]] }
  let(:after_fourier) { [[32, 0], [2.8, 7.1], [8, 2], [-2.8, 7.1], [-8, 0], [-2.8, -7.1], [8, -2], [2.8, -7.1]] }

  before do
    @signal = Implemesh::Signal.new
    @signal.start_time = 0
    @signal.frequency = 1000
  end

  context "forward transformation" do

    it "gives correct results" do
      @signal.samples = before_fourier
      result = dft.perform(@signal)
      expect(result.samples.flatten).to be_similar_array_to after_fourier.flatten
    end
  end

  context "inverse transformation" do

    it "gives correct results" do
      @signal.samples = after_fourier
      result = dft.perform(@signal, :inverse => true)
      expect(result.samples.flatten).to be_similar_array_to before_fourier.flatten
    end
  end
end