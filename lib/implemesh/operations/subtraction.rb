
module Implemesh
  module Operations
    module Subtraction

      def self.perform(*args)
        BasicOperation.new.perform(*args, -> (a, b) { a - b })
      end
    end
  end
end