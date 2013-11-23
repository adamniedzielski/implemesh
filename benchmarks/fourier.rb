
require_relative 'benchmark_helper'

[16.0, 32.0, 64.0, 128.0, 256.0, 512.0, 1024.0].each do |frequency|
  signal = Implemesh::Generators::Sine.generate(:duration => 1.0, :frequency => frequency)
  repetitions = (10240 / frequency).to_i

  puts "#{frequency.to_i} samples"

  fft = Benchmark.realtime { repetitions.times { Implemesh::Operations::FFT.perform(signal) } } / repetitions
  dft = Benchmark.realtime { repetitions.times { Implemesh::Operations::DFT.perform(signal) } } / repetitions
  fct = Benchmark.realtime { repetitions.times { Implemesh::Operations::FCT.perform(signal) } } / repetitions
  dct = Benchmark.realtime { repetitions.times { Implemesh::Operations::DCT.perform(signal) } } / repetitions

  puts "FFT: #{fft} DFT: #{dft}"
  puts "FCT: #{fct} DCT: #{dct}"
end