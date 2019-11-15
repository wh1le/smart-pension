RSpec.describe LogParser::CLI do
  let(:filepath) { 'webserver.log' }
  let(:strategy) { 'popularity' }

  let(:options_hash) do
    {
      filepath: filepath,
      strategy: strategy 
    }
  end

  describe '.parse_options' do
    context 'there are no arguments' do
      it 'raises NoOptionsError' do
        expect { described_class.parse_options(arguments) }
          .to raise_error { LogParser::CLI::NoOptionsError }
      end
    end

    it 'returns hash' do
      expect(described_class.parse_options([filepath, strategy]))
        .to eq(options_hash)
    end
  end

  describe '.start' do
    let(:dummy_analyser) do
      double('LogParser::Processor', strategy: strategy, filepath: filepath)
    end

    before do
      allow(LogParser::Processor).to receive(:new).with(options_hash).and_return(dummy_analyser)
    end

    it 'calls LogParser::Analyser#process' do
      expect(dummy_analyser).to receive(:process)

      described_class.start(options_hash)
    end
  end
end
