
module Implemesh
  module Comparators
    class Base < Struct.new(:first_signal, :second_signal)

      def initialize(first_signal, second_signal)
        super
        check_initial_conditions
      end

      def mean_squared_error
        squared_error / first_signal.samples.size 
      end

      def squared_error
        sum = 0.0

        first_signal.samples.zip(second_signal.samples).each do |left, right|
          sum += ((left.first - right.first) ** 2)
        end

        sum
      end

      private

        def check_initial_conditions
          raise "Different frequencies" if first_signal.frequency != second_signal.frequency
          raise "Different start times" if first_signal.start_time != second_signal.start_time
        end
    end
  end
end