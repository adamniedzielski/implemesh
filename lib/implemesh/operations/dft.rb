
require 'complex'

module Implemesh
  module Operations
    module DFT

      def self.perform(signal, params = {})
        inverse = params[:inverse] || false
        DFT.new(signal, inverse).perform
      end

      class DFT < Struct.new(:signal, :inverse)

        attr_accessor :array

        def perform
          self.array = signal.samples

          result = signal.dup
          result.samples = proccess_array
          result
        end

        def proccess_array
          sign = inverse ? 1 : -1
          result = []

          array.size.times do |index|
            result[index] = 0 
            array.each_with_index do |inner, inner_index|
              result[index] += Complex(*inner) * Math.exp(sign * 2 * Math::PI * Complex::I * index * inner_index / array.size)
            end
            if inverse
              result[index] /= array.size
            end
            result[index] = result[index].rectangular
          end

          result 
        end
      end
    end
  end
end