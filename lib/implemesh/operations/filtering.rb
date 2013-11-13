
module Implemesh
  module Operations
    module Filtering

      def self.perform(signal, params)
        cutoff_frequency = params[:cutoff_frequency] || 25
        coefficients = params[:coefficients] || 5
        window = params[:blackman_window] || false
        bandpass = params[:bandpass] || false
        Filtering.new(signal, cutoff_frequency, coefficients, window, bandpass).perform
      end

      class Filtering < Struct.new(:signal, :cutoff_frequency, :coefficients, :window, :bandpass)

        def perform
          Implemesh::Operations::Convolution.perform(signal, impulse_response)
        end

        private

          def impulse_response
            response = Implemesh::Signal.new
            response.frequency = signal.frequency
            response.start_time = signal.start_time

            response.samples = Array.new(coefficients) do |n|
              if 2 * n == (coefficients - 1)
                real_value = 2 / big_k 
              else
                real_value = Math.sin(2 * Math::PI / big_k * (n - (coefficients - 1) / 2.0)) / (Math::PI * (n - (coefficients - 1) / 2.0))
              end

              [real_value, 0]
            end

            apply_blackman_window(response) if window
            shift_for_bandpass_filter(response) if bandpass

            response
          end

          def big_k
            signal.frequency / cutoff_frequency.to_f
          end

          def apply_blackman_window(signal)
            signal.samples.each_index do |n|
              result = signal.samples[n].first * (0.42 - 0.5 * Math.cos(2 * Math::PI * n / coefficients) + 0.08 * Math.cos(4 * Math::PI * n / coefficients))
              signal.samples[n] = [result, 0]
            end
          end

          def shift_for_bandpass_filter(signal)
            signal.samples.each_index do |n|
              result = signal.samples[n].first * 2 * Math.sin(Math::PI * n / 2)
              signal.samples[n] = [result, 0]
            end
          end         
      end
    end
  end
end