require 'implemesh/generators/base'

module Implemesh
  module Generators
    module SymmetricRectangular

      DEFAULT_PERIOD = 1.0
      DEFAULT_DUTY_CYCLE = 0.5
      DEFAULT_PHASE = 0.0

      def self.generate(params = {})
        period = params[:period] || DEFAULT_PERIOD
        duty_cycle = params[:duty_cycle] || DEFAULT_DUTY_CYCLE
        phase = params[:phase] || DEFAULT_PHASE

        base = Implemesh::Generators::Base.new(params)
        base.generate -> (sample) do
          samples_in_period = (period * @frequency).to_i
          sample_in_base_period = (sample + (@start_time - phase) * @frequency).to_i % samples_in_period
          if sample_in_base_period <= duty_cycle * samples_in_period
            @amplitude
          else
            - @amplitude
          end
        end
      end
    end
  end
end