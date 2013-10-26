
module Implemesh
  module Operations
    module Sampling

      def self.perform(*args)
        Sampling.new(*args).perform
      end

      class Sampling < Struct.new(:signal, :frequency)

        def perform
          calculate_ratio

          result = Implemesh::Signal.new
          result.frequency = frequency
          result.start_time = signal.start_time

          result.samples = signal.samples.each_slice(@ratio).map(&:first)
          result
        end

        private

          def calculate_ratio
            @ratio = signal.frequency / frequency
            raise "Old : new frequency ratio is not an integer" unless (@ratio - @ratio.to_i).abs < 0.001
          end
      end
    end
  end
end