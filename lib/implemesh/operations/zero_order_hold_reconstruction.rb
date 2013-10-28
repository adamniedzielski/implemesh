
module Implemesh
  module Operations
    module ZeroOrderHoldReconstruction

      def self.perform(*args)
        ZeroOrderHoldReconstruction.new(*args).perform
      end

      class ZeroOrderHoldReconstruction < Struct.new(:signal, :frequency)

        def perform
          calculate_ratio

          result = Implemesh::Signal.new
          result.frequency = frequency
          result.start_time = signal.start_time

          signal.samples.each do |sample|
            @ratio.to_i.times { result.samples << sample }
          end

          result
        end

        private

          def calculate_ratio
            @ratio = frequency / signal.frequency
            raise "New : old frequency ratio is not an integer" unless (@ratio - @ratio.to_i).abs < 0.001
          end
      end
    end
  end
end