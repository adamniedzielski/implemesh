require 'implemesh/generators/base'

module Implemesh
  module Generators
    module KroneckerDelta

      DEFAULT_IMPULSE_TIME = 0.0

      def self.generate(params = {})
        impulse_time = params[:impulse_time] || DEFAULT_IMPULSE_TIME

        base = Implemesh::Generators::Base.new(params)
        base.generate -> (sample) do
          sample_time = sample / @frequency - @start_time
          if sample_time == impulse_time
            @amplitude
          else
            0.0
          end
        end
      end
    end
  end
end