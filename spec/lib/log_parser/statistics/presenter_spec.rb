RSpec.describe LogParser::Statistics::Presenter do
  let(:result) do
    [
      ['/about', 2],
      ['/home', 1]
    ]
  end

  let(:strategy) { LogParser::Statistics::Strategies::Popularity }

  subject { described_class.new(result: result, strategy: strategy) }

  describe '.initialize' do
    it 'assigns result to @result' do
      expect(subject.instance_variable_get(:@result))
        .to eq(result)
    end

    it 'assigns result to @strategy' do
      expect(subject.instance_variable_get(:@strategy))
        .to eq(strategy)
    end
  end

  describe '#perform' do
    context 'when strategy = popularity' do
      it 'outputs right report' do
        expect { subject.report_to_stdout }
          .to output("/about 2 visits\n/home 1 visits\n").to_stdout
      end
    end

    context 'when strategy = popularity_uniquness' do
        let(:strategy) { LogParser::Statistics::Strategies::PopularityUniquness }

      it 'outputs right report' do
        expect { subject.report_to_stdout }
          .to output("/about 2 unique visits\n/home 1 unique visits\n").to_stdout
      end
    end
  end
end
