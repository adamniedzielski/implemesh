require 'implemesh/signal'

module Implemesh
  module Generators
    class Sine

      def generate
        start_time = 0
        duration = 10.0
        frequency = 1000
        amplitude = 1.0
        period = 2 * Math::PI

        signal = Implemesh::Signal.new
        signal.start_time = start_time
        signal.frequency = frequency

        samples = []
        samples_count = duration * frequency
        samples_count.to_i.times do |sample|
          imaginary = 0
          real = amplitude * Math.sin(2 * Math::PI / period * (sample.to_f / frequency - start_time))
          samples << [real, imaginary]
        end

        signal.samples = samples
        signal 
      end
    end
  end
end