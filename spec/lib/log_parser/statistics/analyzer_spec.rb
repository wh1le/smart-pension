RSpec.describe LogParser::Statistics::Analyzer do
  let(:strategy) { 'popularity' }
  let(:records) do
    [
      LogParser::Data::Model::LogRecord.new( '/about', '127.0.0.1'),
      LogParser::Data::Model::LogRecord.new( '/home', '127.2.4.1'),
      LogParser::Data::Model::LogRecord.new( '/about', '127.9.0.1'),
    ]
  end

  subject { described_class.new(records: records, strategy: strategy) }

  describe '.initialize' do
    it 'assigns records to @records' do
      expect(subject.instance_variable_get(:@records))
        .to eq(records)
    end

    it 'assigns strategy to @strategy' do
      expect(subject.instance_variable_get(:@strategy))
        .to eq(strategy)
    end
  end

  describe '#perform' do
    it 'loads right strategy and calls it' do
    end
  end
end
