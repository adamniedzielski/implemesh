require 'implemesh/signal'

module Implemesh
  module Generators
    class Base

      DEFAULT_START_TIME = 0.0
      DEFAULT_DURATION = 10.0
      DEFAULT_FREQUENCY = 1000.0
      DEFAULT_AMPLITUDE = 1.0

      def initialize(params)
        @params = params
      end

      def generate(proc)
        fetch_params

        signal = Implemesh::Signal.new
        signal.start_time = @start_time
        signal.frequency = @frequency

        samples = []
        samples_count = @duration * @frequency
        samples_count.to_i.times do |sample|
          imaginary = 0
          real = instance_exec(sample, &proc)
          samples << [real, imaginary]
        end

        signal.samples = samples
        signal 
      end

      private

        def fetch_params
          @start_time = @params[:start_time] || DEFAULT_START_TIME
          @duration = @params[:duration] || DEFAULT_DURATION
          @frequency = @params[:frequency] || DEFAULT_FREQUENCY
          @amplitude = @params[:amplitude] || DEFAULT_AMPLITUDE
        end
    end
  end
end
