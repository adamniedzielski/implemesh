
module Implemesh
  module Operations
    module Multiplication

      def self.perform(*args)
        BasicOperation.new.perform(*args, -> (a, b) { a * b })
      end
    end
  end
end