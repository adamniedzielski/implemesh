
module Implemesh
  module Operations

    class Transform < Struct.new(:signal, :inverse)

      attr_accessor :array

      def perform
        self.array = signal.samples

        result = signal.dup
        result.samples = proccess_array
        result
      end
    end
  end
end