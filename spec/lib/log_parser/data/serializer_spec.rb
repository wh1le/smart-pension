RSpec.describe LogParser::Data::Serializer do
  let(:data) { File.open(File.join(LogParser.root, 'spec', 'fixtures', 'webserver.log'), 'r').read }

  subject { described_class.new(data) }

  describe '.initialize' do
    it 'assigns data to @data' do
      expect(subject.instance_variable_get(:@data)).to eq(data)
    end
  end

  describe '#serialize_to_objects' do
    context 'when data from file is valid' do
      it 'returns objects of LogRecord' do
        expect(subject.serialize_to_objects.sample).to be_a(LogParser::Data::Model::LogRecord)
      end

      it 'returns objects of valid length' do
        expect(subject.serialize_to_objects.length)
          .to eq(data.split("\n").size)
      end
    end

    context 'when data from file is not valid' do

      context 'when empty attribute' do
        let(:data) { "/about \n \n" }

        it 'raises AttributeIsEmpty error' do
          expect{ subject.serialize_to_objects }.to raise_error { LogParser::Data::Model::AttributeIsEmpty }
        end
      end

      context 'when invalid ip' do
        let(:data) { "/about 12.2.2\n \n" }

        it 'raises InvalidIpAddress error' do
          expect{ subject.serialize_to_objects }.to raise_error { LogParser::Data::Model::InvalidIpAddress }
        end
      end
    end
  end
end
