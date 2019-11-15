RSpec.describe LogParser::Factories::StrategyFactory do
  let(:strategy) { 'popularity' }

  describe '.build' do
    context 'when strategy exists' do
      it 'returns strategy constant' do
        expect(described_class.build(strategy))
          .to eq(LogParser::Statistics::Strategies::Popularity)
      end
    end

    context 'when strategy doesn\'t exist' do
      let(:strategy) { 'fake_strategy' }

      it 'raises error' do
        expect{ described_class.build(strategy) }.to raise_error(StandardError)
      end
    end
  end
end
