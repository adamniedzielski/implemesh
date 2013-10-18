require 'implemesh/operations/basic_operation'

module Implemesh
  module Operations
    module Division

      def self.perform(*args)
        BasicOperation.perform(*args, -> (a, b) { a / b.to_f })
      end
    end
  end
end