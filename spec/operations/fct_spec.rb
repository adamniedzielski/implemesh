require 'spec_helper'

describe Implemesh::Operations::FCT do
  
  let(:fct) { Implemesh::Operations::FCT }

  before do
    @signal = Implemesh::Signal.new
    @signal.start_time = 0
    @signal.frequency = 1000
  end

  context "forward transformation" do

    it "gives correct results" do
      @signal.samples = samples_before_cosine
      result = fct.perform(@signal)
      expect(result.samples.flatten).to be_similar_array_to samples_after_cosine.flatten
    end
  end

  context "inverse transformation" do

    it "gives correct results" do
      @signal.samples = samples_after_cosine
      result = fct.perform(@signal, :inverse => true)
      expect(result.samples.flatten).to be_similar_array_to samples_before_cosine.flatten
    end
  end
end