
module Implemesh
  module Statistics
    module AveragePower

      def average_power
        samples.inject(0) { |sum, sample| sum + (sample.first ** 2) } / samples.size.to_f
      end
    end
  end
end