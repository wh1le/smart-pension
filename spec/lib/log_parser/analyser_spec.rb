RSpec.describe LogParser::Analyser do
  let(:options) do
    {
      filepath: File.join(LogParser.root, 'spec', 'fixtures', 'webserver.log'),
      strategy: 'popularity'
    }
  end

  subject { described_class.new(options) }

  describe '.initialize' do
    it 'assigns filepath to @filepath' do
      expect(subject.instance_variable_get(:@filepath))
        .to eq(options[:filepath])
    end

    it 'assigns strategy to @strategy' do
      expect(subject.instance_variable_get(:@strategy))
        .to eq(options[:strategy])
    end

    let(:dummy_file_validation) do
      double('LogParser::Validation::LogFile', filepath: options[:filepath])
    end

    it 'calls validation' do
      allow(LogParser::Validation::LogFile).to receive(:new)
        .and_return(dummy_file_validation)

      expect(dummy_file_validation).to receive(:perform!)

      subject
    end
  end
end
