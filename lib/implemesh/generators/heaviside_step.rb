require 'implemesh/generators/base'

module Implemesh
  module Generators
    module HeavisideStep

      DEFAULT_STEP_TIME = 0.0

      def self.generate(params = {})
        step_time = params[:step_time] || DEFAULT_STEP_TIME

        base = Implemesh::Generators::Base.new(params)
        base.generate -> (sample) do
          sample_time = sample / @frequency + @start_time
          if sample_time < step_time
            0.0
          elsif sample_time > step_time
            @amplitude
          else
            0.5 * @amplitude
          end
        end
      end
    end
  end
end