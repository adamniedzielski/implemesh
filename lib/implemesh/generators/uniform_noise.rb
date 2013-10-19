require 'implemesh/generators/base'

module Implemesh
  module Generators
    module UniformNoise

      def self.generate(params = {})
        base = Implemesh::Generators::Base.new(params)
        base.generate -> (sample) { rand(- @amplitude .. @amplitude) }
      end
    end
  end
end