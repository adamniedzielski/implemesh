
require 'implemesh/operations/convolution_correlation_common'

module Implemesh
  module Operations
    module Convolution

      def self.perform(*params)
        Convolution.new(*params).perform
      end

      class Convolution < ConvolutionCorrelationCommon

        def calculate_index(i, k)
          i - k
        end
      end
    end
  end
end