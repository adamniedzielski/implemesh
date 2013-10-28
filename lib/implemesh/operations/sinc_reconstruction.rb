
module Implemesh
  module Operations
    module SincReconstruction

      def self.perform(*args)
        SincReconstruction.new(*args).perform
      end

      class SincReconstruction < Struct.new(:signal, :frequency)

        def perform
          calculate_ratio

          result = Implemesh::Signal.new
          result.frequency = frequency
          result.start_time = signal.start_time

          (@ratio.to_i * signal.samples.size).times do |i|
            s = possible_range(i).inject(0) do |sum, sample|
              sum + signal.samples[sample].first * sinc(i / @ratio - sample)
            end
            result.samples[i] = [s, 0]
          end

          result
        end

        private

          def calculate_ratio
            @ratio = frequency / signal.frequency
            raise "New : old frequency ratio is not an integer" unless (@ratio - @ratio.to_i).abs < 0.001
          end

          def possible_range(sample)
            corresponding_sample = (sample / @ratio).round.to_i
            max_spread = [corresponding_sample, signal.samples.size - corresponding_sample - 1].min
            spread = [10, max_spread].min
            (corresponding_sample - spread .. corresponding_sample + spread)
          end

          def sinc(x)
            if x == 0
              1
            else
              Math.sin(Math::PI * x) / (Math::PI * x)
            end
          end
      end
    end
  end
end