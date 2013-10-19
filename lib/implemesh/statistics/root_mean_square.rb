
module Implemesh
  module Statistics
    module RootMeanSquare

      def root_mean_square
        Math.sqrt(self.average_power)
      end
    end
  end
end