require 'bindata'
require 'implemesh/statistics'

module Implemesh
  class Signal

    include Statistics

    attr_accessor :start_time
    attr_accessor :frequency
    attr_accessor :samples

    def initialize
      self.start_time = 0
      self.frequency = 0
      self.samples = []
    end

    def to_file(file)
      signal_record = SignalRecord.new
      signal_record.start_time = start_time
      signal_record.frequency = frequency
      signal_record.samples = samples.flatten
      signal_record.write(file)
    end

    def from_file(file)
      signal_record = SignalRecord.read(file)
      self.start_time = signal_record.start_time
      self.frequency = signal_record.frequency
      self.samples = signal_record.samples.each_slice(2).to_a
    end

    def real_samples
      samples.map(&:first)
    end

    class SignalRecord < BinData::Record
      double_be :start_time
      double_be :frequency
      array :samples, :type => :double_be, :read_until => :eof 
    end
  end
end