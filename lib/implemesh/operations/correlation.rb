
module Implemesh
  module Operations
    module Correlation

      def self.perform(first_signal, second_signal, use_convolution = true)
        if use_convolution
          second_signal.samples.reverse!
          result = Convolution.perform(first_signal, second_signal)
          second_signal.samples.reverse!
          result
        else
          Correlation.new(first_signal, second_signal).perform
        end
      end

      class Correlation < ConvolutionCorrelationCommon

        def calculate_index(i, k)
          k + second_signal.samples.size - 1 - i
        end
      end
    end
  end
end