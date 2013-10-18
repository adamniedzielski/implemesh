require 'implemesh/operations/basic_operation'

module Implemesh
  module Operations
    module Addition

      def self.perform(*args)
        BasicOperation.perform(*args, -> (a, b) { a + b })
      end
    end
  end
end