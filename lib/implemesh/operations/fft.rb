
require 'complex'

module Implemesh
  module Operations
    module FFT

      def self.perform(signal, params = {})
        inverse = params[:inverse] || false
        FFT.new(signal, inverse).perform
      end

      class FFT < Struct.new(:signal, :inverse)

        attr_accessor :array

        def perform
          self.array = signal.samples

          result = signal.dup
          result.samples = proccess_array
          result
        end

        def proccess_array
          sign = inverse ? 1 : -1

          apply_bit_reversal_order

          array.map! do |element|
            Complex(*element)
          end

          n = array.size
          m = 1

          for s in 1 .. logarithm
            m = m * 2
            omega_m = Math.exp(sign * 2.0 / m * Math::PI * Complex::I)

            (0 .. n - 1).step(m) do |k|
              omega = 1

              for j in (0 .. (m / 2 - 1))
                t = omega * array[k + j + m / 2]
                u = array[k + j]
                array[k + j] = u + t
                array[k + j + m / 2] = u - t
                omega = omega * omega_m
              end
            end
          end

          array.map! do |element|
            if inverse
              element /= array.size
            end
            element.rectangular      
          end

          array
        end

        def apply_bit_reversal_order
          result = []

          array.size.times do |i|
            result[revert_bits(i)] = array[i]
          end

          self.array = result
        end

        def revert_bits(number)
          result = 0

          logarithm.times do
            result <<= 1
            if (number & 1 != 0)
              result |= 1
            end
            number >>= 1
          end

          result
        end

        def logarithm
          @logarithm ||= Math.log2(array.size).round.to_i
        end
      end
    end
  end
end