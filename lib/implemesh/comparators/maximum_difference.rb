
require 'implemesh/comparators/base'

module Implemesh
  module Comparators
    module MaximumDifference

      def self.compare(first_signal, second_signal)
        first_signal.samples.map(&:first).zip(second_signal.samples.map(&:first)).map do |left, right|
          (left - right).abs
        end.max
      end
    end
  end
end