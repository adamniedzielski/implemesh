
module Implemesh
  module Operations
    module Division

      def self.perform(*args)
        BasicOperation.new.perform(*args, -> (a, b) { a / b.to_f })
      end
    end
  end
end