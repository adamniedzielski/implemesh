
module Implemesh
  module Operations
    module Quantization

      def self.perform(*args)
        Quantization.new(*args).perform
      end

      class Quantization < Struct.new(:signal, :levels)

        def perform
          calculate_step

          result = Implemesh::Signal.new
          result.frequency = signal.frequency
          result.start_time = signal.start_time

          result.samples = signal.samples.map do |real, imaginary|
            new_real = ((real - @min - 0.00001) / @step).to_i * @step + @min
            [new_real, imaginary]
          end

          result
        end

        private

          def calculate_step
            @min, max = signal.real_samples.minmax
            @step = (max - @min).to_f / levels
          end
      end
    end
  end
end