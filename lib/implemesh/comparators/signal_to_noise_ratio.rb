
require 'implemesh/comparators/base'

module Implemesh
  module Comparators
    module SignalToNoiseRatio

      def self.compare(*args)
        SignalToNoiseRatio.new(*args).compare
      end

      class SignalToNoiseRatio < Base

        def compare
          upper = 0.0
          first_signal.samples.each do |real, imaginary|
            upper += real ** 2
          end

          10 * Math.log10(upper / squared_error)
        end
      end
    end
  end
end