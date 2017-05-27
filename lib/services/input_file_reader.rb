class InputFileReader
  def initialize(input_data = nil)
    @input_data = input_data || ARGF.read
  end

  attr_accessor :input_data, :lines

  def lines
    @lines ||= self.input_data.to_s.split($/)
  end
end
