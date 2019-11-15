RSpec.describe LogParser::Statistics::Analyser do
  let(:strategy) { LogParser::Statistics::Strategies::Popularity }
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

  describe '#perform_strategy' do
    context 'when strategy is :popularity' do
      let(:dummy_popularity) { double('LogParser::Statistics::Strategies::Popularity') }

      it 'loads Strategies::Popularity and calls it' do
        allow(LogParser::Statistics::Strategies::Popularity).to receive(:new)
          .with(records: records)
          .and_return(dummy_popularity)

        expect(dummy_popularity).to receive(:perform)

        subject.perform_strategy
      end
    end

    context 'when strategy is :popularity_uniquness' do
      let(:strategy) { LogParser::Statistics::Strategies::PopularityUniquness }
      let(:dummy_popularity) { double('LogParser::Statistics::Strategies::PopularityUniquness') }

      it 'loads Strategies::Popularity and calls it' do
        allow(LogParser::Statistics::Strategies::PopularityUniquness).to receive(:new)
          .with(records: records)
          .and_return(dummy_popularity)

        expect(dummy_popularity).to receive(:perform)

        subject.perform_strategy
      end
    end
  end
end
