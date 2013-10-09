require 'spec_helper'
require 'implemesh/signal'

describe Implemesh::Signal do
  
  let(:signal) { Implemesh::Signal.new }

  specify "fields" do
    expect(signal).to respond_to(:start_time)
    expect(signal).to respond_to(:frequency)
    expect(signal).to respond_to(:samples)
  end

  specify "methods" do
    expect(signal).to respond_to(:to_file)
    expect(signal).to respond_to(:from_file)
  end

  describe "#to_file and #from_file" do

    let(:second_signal) { Implemesh::Signal.new }
    let(:mocked_io) { StringIO.new }

    it "saves and reads start time" do
      signal.start_time = 76
      signal.to_file(mocked_io)
      mocked_io.rewind
      second_signal.from_file(mocked_io)
      expect(second_signal.start_time).to eq 76
    end

    it "saves and reads frequency" do
      signal.frequency = 1200
      signal.to_file(mocked_io)
      mocked_io.rewind
      second_signal.from_file(mocked_io)
      expect(second_signal.frequency).to eq 1200
    end

    it "saves and reads samples" do
      signal.samples = [[4.21, 3.21], [8.98, 6.66], [4.44, 1.21]]
      signal.to_file(mocked_io)
      mocked_io.rewind
      second_signal.from_file(mocked_io)
      expect(second_signal.samples).to eq [[4.21, 3.21], [8.98, 6.66], [4.44, 1.21]]   
    end
  end
end