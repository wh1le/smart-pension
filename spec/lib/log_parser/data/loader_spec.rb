RSpec.describe LogParser::Data::Loader do
  let(:filepath) { File.join(LogParser.root, 'spec', 'fixtures', 'webserver.log') }

  subject { described_class.new(filepath: filepath) }

  describe '.initialize' do
    it 'assigns filepath to @filepath' do
      expect(subject.instance_variable_get(:@filepath)).to eq(filepath)
    end
  end

  describe '#records' do
    let(:dummy_serializer) { double('LogParser::Data::Serializer') }

    it 'calls serializer' do
      allow(LogParser::Data::Serializer).to receive(:new).and_return(dummy_serializer)
      expect(dummy_serializer).to receive(:serialize_to_objects)

      subject.records
    end
  end
end
