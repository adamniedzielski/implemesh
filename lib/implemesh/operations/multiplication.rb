require 'implemesh/operations/basic_operation'

module Implemesh
  module Operations
    module Multiplication

      def self.perform(*args)
        BasicOperation.perform(*args, -> (a, b) { a * b })
      end
    end
  end
end