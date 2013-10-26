
def prepare_signals_for_comparison

  before do
    @first_signal = Implemesh::Signal.new
    @first_signal.start_time = 0
    @first_signal.frequency = 1000
    @second_signal = @first_signal.dup
    @first_signal.samples = [[1, 0], [2, 0]]
    @second_signal.samples = [[4, 0], [6, 0]]
  end

end