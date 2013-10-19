require 'implemesh/generators/base'

module Implemesh
  module Generators
    module FullRectifiedSine

      DEFAULT_PERIOD = 2 * Math::PI

      def self.generate(params = {})
        period = params[:period] || DEFAULT_PERIOD

        base = Implemesh::Generators::Base.new(params)
        base.generate -> (sample) do
          sine = Math.sin(2 * Math::PI / period * (sample.to_f / @frequency - @start_time))
          @amplitude * sine.abs
        end
      end
    end
  end
end