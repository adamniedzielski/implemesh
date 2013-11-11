
require 'implemesh/operations/binary_operation'

module Implemesh
  module Operations
    class BasicOperation

      include BinaryOperation

      def perform(first_signal, second_signal, proc)
        result = init_binary_operation(first_signal, second_signal)

        result.samples = first_signal.samples.zip(second_signal.samples).map do |left, right|
          [proc.call(left.first, right.first), proc.call(left.last, right.last)]
        end
        
        result
      end
    end
  end
end