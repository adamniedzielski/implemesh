
module Implemesh
  module Statistics
    module Variance

      def variance
        mean_value = self.mean_value
        samples.inject(0) { |sum, sample| sum + ((sample.first - mean_value) ** 2) } / samples.size.to_f
      end
    end
  end
end