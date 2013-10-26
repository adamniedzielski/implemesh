
require 'implemesh/comparators/base'

module Implemesh
  module Comparators
    module PeakSignalToNoiseRatio

      def self.compare(*args)
        PeakSignalToNoiseRatio.new(*args).compare
      end

      class PeakSignalToNoiseRatio < Base

        def compare
          10 * Math.log10(first_signal.samples.max_by(&:first).first / mean_squared_error)
        end
      end
    end
  end
end