require 'implemesh/generators/base'

require 'rubystats'

module Implemesh
  module Generators
    module ImpulseNoise

      DEFAULT_PROBABILITY = 0.5

      def self.generate(params = {})
        probability = params[:probability] || DEFAULT_PROBABILITY

        base = Implemesh::Generators::Base.new(params)
        base.generate -> (sample) do 
          if rand(0.0 .. 1.0) <= probability
            @amplitude
          else
            0.0
          end
        end
      end
    end
  end
end