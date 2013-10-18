module Implemesh
  module Operations
    module BasicOperation

      def self.perform(first_signal, second_signal, proc)
        raise "Different frequencies" if first_signal.frequency != second_signal.frequency
        raise "Different start times" if first_signal.start_time != second_signal.start_time

        result = Implemesh::Signal.new
        result.frequency = first_signal.frequency
        result.start_time = first_signal.start_time

        result.samples = first_signal.samples.zip(second_signal.samples).map do |left, right|
          [proc.call(left.first, right.first), proc.call(left.last, right.last)]
        end
        
        result
      end
    end
  end
end