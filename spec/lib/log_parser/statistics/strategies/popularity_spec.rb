RSpec.describe LogParser::Statistics::Strategies::Popularity do
  let(:records) do
    [
      LogParser::Data::Model::LogRecord.new( '/about', '127.0.0.1'),
      LogParser::Data::Model::LogRecord.new( '/home', '127.2.4.1'),
      LogParser::Data::Model::LogRecord.new( '/about', '127.9.0.1'),
    ]
  end

  subject { described_class.new(records: records) }

  describe '.initialize' do
    it 'assigns records to @records' do
      expect(subject.instance_variable_get(:@records)).to eq(records)
    end
  end

  describe '#perform' do
    it 'returns right result' do
      expect(subject.perform).to eq([
        ['/about', 2],
        ['/home', 1]
      ])
    end
  end
end
