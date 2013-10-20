require 'implemesh/generators/base'

module Implemesh
  module Generators
    module HalfRectifiedSine

      DEFAULT_PERIOD = 2 * Math::PI
      DEFAULT_PHASE = 0.0

      def self.generate(params = {})
        period = params[:period] || DEFAULT_PERIOD
        phase = params[:phase] || DEFAULT_PHASE

        base = Implemesh::Generators::Base.new(params)
        base.generate -> (sample) do
          sine = Math.sin(2 * Math::PI / period * (sample.to_f / @frequency + @start_time - phase))
          0.5 * @amplitude * ( sine + sine.abs )
        end
      end
    end
  end
end