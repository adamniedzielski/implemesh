
require 'implemesh/operations/binary_operation'

module Implemesh
  module Operations
    class ConvolutionCorrelationCommon < Struct.new(:first_signal, :second_signal)

      include BinaryOperation

      def perform
        result = init_binary_operation(first_signal, second_signal)

        result_length = first_signal.samples.size + second_signal.samples.size - 1

        result_length.times do |i|

          real_value = 0

          first_signal.real_samples.each_with_index do |first_sample, k|
            real_value += first_sample * sample_if_exists(second_signal.real_samples, calculate_index(i, k))
          end

          result.samples[i] = [real_value, 0]
        end

        result
      end

      def sample_if_exists(samples, index)
        if index < 0 || index >= samples.size
          0
        else
          samples[index]
        end
      end
    end
  end
end