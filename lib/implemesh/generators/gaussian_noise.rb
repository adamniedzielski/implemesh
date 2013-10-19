require 'implemesh/generators/base'

require 'rubystats'

module Implemesh
  module Generators
    module GaussianNoise

      def self.generate(params = {})
        normal_generator = Rubystats::NormalDistribution.new(0, 1)

        base = Implemesh::Generators::Base.new(params)
        base.generate -> (sample) { @amplitude * normal_generator.rng }
      end
    end
  end
end