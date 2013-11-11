
module Implemesh
  module Operations
    module Addition

      def self.perform(*args)
        BasicOperation.new.perform(*args, -> (a, b) { a + b })
      end
    end
  end
end