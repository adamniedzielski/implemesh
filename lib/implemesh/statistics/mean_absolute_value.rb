
module Implemesh
  module Statistics
    module MeanAbsoluteValue

      def mean_absolute_value
        samples.inject(0) { |sum, sample| sum + sample.first.abs } / samples.size.to_f
      end
    end
  end
end