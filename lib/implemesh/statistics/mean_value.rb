
module Implemesh
  module Statistics
    module MeanValue

      def mean_value
        samples.inject(0) { |sum, sample| sum + sample.first } / samples.size.to_f
      end
    end
  end
end