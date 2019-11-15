RSpec.describe LogParser::Validation::LogFile do
  let(:filepath)  { File.join(LogParser.root, 'spec', 'fixtures', 'webserver.log') }

  subject { described_class.new(filepath: filepath) }

  describe '.initialize' do
    it 'assigns filepath to @filepath' do
      expect(subject.instance_variable_get(:@filepath))
        .to eq(filepath)
    end
  end

  describe '#perform!' do
    context 'when file doesn\'t exist' do
      let(:filepath) { './not_found' }

      it 'raises error' do
        expect { subject.perform! }.to raise_error { LogParser::Validation::LogFileInvalidError }
      end

      it 'adds message to messages' do
        expect { subject.perform! }.to raise_error { LogParser::Validation::LogFileInvalidError }
        expect(subject.messages).to include('File doesn\'t exist')
      end
    end

    context 'when file exists' do
      context 'when has correct extension' do
        it 'returns true' do
          expect(subject.perform!).to eq(true)
        end
      end

      context 'when has incorect extension' do
        let(:filepath) { File.join(LogParser.root, 'spec', 'spec_helper.rb') }

        it 'raises error' do
          expect { subject.perform! }.to raise_error { LogParser::Validation::LogFileInvalidError }
        end

        it 'adds message to messages' do
          expect { subject.perform! }.to raise_error { LogParser::Validation::LogFileInvalidError }
          expect(subject.messages).to include('Extension is not valid.')
        end
      end
    end
  end
end
