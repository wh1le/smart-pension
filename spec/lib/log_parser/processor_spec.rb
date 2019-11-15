RSpec.describe LogParser::Processor do
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

  end

  describe '#get_analytics' do
    let(:dummy_file_validation) do
      double('LogParser::Validation::LogFile', filepath: options[:filepath])
    end

    context 'strategy is invalid' do
      before do
        options[:strategy] = 'awesome'
      end

      it 'raises StrategyInvalid error' do
        expect { subject.get_analytics }.to raise_error{ LogParser::StrategyInvalid }
      end
    end

    context 'filepath is invalid' do 
      before do
        options[:filepath] = '../not_found'
      end

      it 'raises error' do
        expect { subject.get_analytics }.to raise_error { LogParser::StrategyInvalid }
      end
    end

    it 'calls validation' do
      allow(LogParser::Validation::LogFile).to receive(:new)
        .and_return(dummy_file_validation)

      expect(dummy_file_validation).to receive(:perform!)

      subject.get_analytics
    end

    let(:log_record_objects) do
      [
        LogParser::Data::Model::LogRecord.new( '/about', '127.0.0.1'),
        LogParser::Data::Model::LogRecord.new( '/home', '127.2.4.1'),
        LogParser::Data::Model::LogRecord.new( '/about', '127.9.0.1'),
      ]
    end

    let(:analyzer_result) { {} }
 
    let(:dummy_loader) do
      double('Data::Loader', filepath: options[:filepath])
    end

    let(:dummy_analyzer) do
      double('Strategy::Analyzer', records: log_record_objects, startegy: options[:strategy])
    end

    let(:dummy_presenter) do
      double('Strategy::Presenter', result: analyzer_result, strategy: options[:strategy])
    end

    it 'calls all required services in the right way' do
      allow(LogParser::Data::Loader).to receive(:new).with(filepath: options[:filepath])
        .and_return(dummy_loader)

      allow(LogParser::Statistics::Anaylizer).to receive(:new)
        .with(records: log_record_objects, strategy: options[:strategy])
        .and_return(dummy_analyzer)

      allow(LogParser::Statistics::Presenter).to receive(:new)
        .with(result: analyzer_result, strategy: options[:strategy])

      expect(dummy_loader).to receive(:records).and_return(log_record_objects)

      expect(dummy_analyzer).to receive(:perform_strategy).and_return(analyzer_result)
      expect(dummy_presenter).to receive(:report_to_stdout)

      subject.get_analytics
    end
  end
end
