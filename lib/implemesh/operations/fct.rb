
require 'implemesh/operations/transform'
require 'implemesh/operations/cosine_common'
require 'complex'

module Implemesh
  module Operations
    module FCT

      def self.perform(signal, params = {})
        inverse = params[:inverse] || false
        FCT.new(signal, inverse).perform
      end

      class FCT < Transform

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
            transform_x_to_y

            fft = Implemesh::Operations::FFT::FFT.new
            fft.array = array
            fft_result = fft.proccess_array

            for m in 0 .. array.size - 1
              result[m] = [(c(m) * Math.exp(-Math::PI * Complex::I * m / (2 * array.size)) * Complex(*fft_result[m])).real, 0]
            end

            result
          end 
        end

        def transform_x_to_y
          result = []

          for n in 0 .. array.size / 2 - 1
            result[n] = array[2 * n]
            result[array.size - 1 - n] = array[2 * n + 1]
          end

          self.array = result
        end
      end
    end
  end
end