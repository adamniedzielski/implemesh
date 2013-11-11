
def prepare_signals_for_convolution_or_correlation
  before do
    @first_signal = Implemesh::Signal.new
    @first_signal.start_time = 0
    @first_signal.frequency = 1000
    @second_signal = @first_signal.dup
    @first_signal.samples = [[1, 0], [2, 0], [3, 0], [4, 0]]
    @second_signal.samples = [[5, 0], [6, 0], [7, 0]]
  end
end