require 'spec_helper'
require 'implemesh/operations/division'
require 'implemesh/signal'

describe Implemesh::Operations::Division do
  
  let(:division) { Implemesh::Operations::Division }

  prepare_signals_for_basic_operations

  it "adds two signals" do
    result = division.perform(@first_signal, @second_signal)
    expect(result.samples.first.last).to be_within(0.01).of(0.333)
  end
end