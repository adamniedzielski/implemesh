
require 'implemesh/comparators/base'

module Implemesh
  module Comparators
    module MeanSquaredError

      def self.compare(*args)
        MeanSquaredError.new(*args).compare
      end

      class MeanSquaredError < Base

        def compare
          mean_squared_error         
        end
      end
    end
  end
end