
module Implemesh
  module Operations
    module BinaryOperation

      def init_binary_operation(first_signal, second_signal)
        raise "Different frequencies" if first_signal.frequency != second_signal.frequency
        raise "Different start times" if first_signal.start_time != second_signal.start_time

        result = Implemesh::Signal.new
        result.frequency = first_signal.frequency
        result.start_time = first_signal.start_time

        result
      end
    end
  end
end