require 'implemesh/generators/base'

module Implemesh
  module Generators
    module HalfRectifiedSine

      DEFAULT_PERIOD = 2 * Math::PI

      def self.generate(params = {})
        period = params[:period] || DEFAULT_PERIOD

        base = Implemesh::Generators::Base.new(params)
        base.generate -> (sample) do
          sine = Math.sin(2 * Math::PI / period * (sample.to_f / @frequency - @start_time))
          0.5 * @amplitude * ( sine + sine.abs )
        end
      end
    end
  end
end