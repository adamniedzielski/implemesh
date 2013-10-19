require 'implemesh/generators/base'

module Implemesh
  module Generators
    module Sine

      DEFAULT_PERIOD = 2 * Math::PI

      def self.generate(params = {})
        period = params[:period] || DEFAULT_PERIOD

        base = Implemesh::Generators::Base.new(params)
        base.generate -> (sample) { @amplitude * Math.sin(2 * Math::PI / period * (sample.to_f / @frequency - @start_time)) }
      end
    end
  end
end