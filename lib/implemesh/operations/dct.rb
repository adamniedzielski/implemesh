
require 'implemesh/operations/transform'
require 'implemesh/operations/cosine_common'

module Implemesh
  module Operations
    module DCT

      def self.perform(signal, params = {})
        inverse = params[:inverse] || false
        DCT.new(signal, inverse).perform
      end

      class DCT < Transform

        include CosineCommon

        def proccess_array
          result = []

          if inverse
            for n in 0 .. (array.size - 1)
              sum = 0
              for m in 0 .. (array.size - 1)
                sum += c(m) * array[m].first * Math.cos((Math::PI * (2 * n + 1) * m) / (2 * array.size))
              end
              result[n] = [sum, 0]
            end

            result
          else
            for m in 0 .. (array.size - 1)
              sum = 0
              for n in 0 .. (array.size - 1)
                sum += array[n].first * Math.cos((Math::PI * (2 * n + 1) * m) / (2 * array.size))
              end
              result[m] = [c(m) * sum, 0]
            end

            result
          end 
        end
      end
    end
  end
end