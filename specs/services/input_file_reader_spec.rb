describe InputFileReader do
  include Minitest::Hooks

  let(:stub_stdin) { "line-1\nline-2\nline-3" }

  around do |&block|
    ARGF.stub :read, stub_stdin do
      super(&block)
    end
  end

  it 'reads input data from STDIN' do
    raw_input = "line-1\nline-2\nline-3"
    InputFileReader.new.input_data.must_equal raw_input
  end

  it 'reads input data from initializer' do
    raw_input = "line-1\nline-2\nline-3"
    InputFileReader.new(raw_input).input_data.must_equal raw_input
  end

  it 'splits input data' do
    lines = InputFileReader.new("line-1\nline-2\nline-3").lines
    lines.size.must_equal 3
  end
end
