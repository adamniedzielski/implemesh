
def prepare_signals_for_basic_operations

  before do
    @first_signal = Implemesh::Signal.new
    @first_signal.start_time = 0
    @first_signal.frequency = 1000
    @second_signal = @first_signal.dup
    @first_signal.samples = [[1, 2]]
    @second_signal.samples = [[4, 6]]
  end

end