RSpec.describe LogParser::CLI do
  describe '.parse_options' do
    context 'there are no arguments' do
      it 'raises NoOptionsError' do
        expect { described_class.parse_options(arguments) }
          .to raise_error { LogParser::CLI::NoOptionsError }
      end
    end
  end
end
