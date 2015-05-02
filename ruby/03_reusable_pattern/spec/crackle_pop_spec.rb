require 'spec_helper'

describe CracklePop do

  it { is_expected.to respond_to :run }

  describe '#run' do

    let(:output) { double() }
    let(:run) { Proc.new { subject.run(output) } }

    before(:each) do
      allow(output).to receive(:puts)
    end

    it { expect(&run).not_to raise_error }

    it 'prints a message for each number' do
      expect(output).to receive(:puts).exactly(100).times
      run.call(output)
    end

    it 'prints as many "Crackle" as necessary' do
      expect(output).to receive(:puts).with('Crackle').exactly(27).times
      expect(output).to receive(:puts).exactly(73).times
      run.call(output)
    end

    it 'prints as many "Pop" as necessary' do
      expect(output).to receive(:puts).with('Pop').exactly(14).times
      expect(output).to receive(:puts).exactly(86).times
      run.call(output)
    end

    it 'prints as many "CracklePop" as necessary' do
      expect(output).to receive(:puts).with('CracklePop').exactly(6).times
      expect(output).to receive(:puts).exactly(94).times
      run.call(output)
    end

    context 'when crackle is 3 and pop is 7' do

      let(:output) { double() }
      let(:run) { Proc.new { CracklePop.new({ crackle: 3, pop: 7 }).run(output) } }

      before(:each) do
        allow(output).to receive(:puts)
      end

      it 'prints a message for each number' do
        expect(output).to receive(:puts).exactly(100).times
        run.call(output)
      end

      it 'prints as many "Crackle" as necessary' do
        expect(output).to receive(:puts).with('Crackle').exactly(27).times
        expect(output).to receive(:puts).exactly(73).times
        run.call(output)
      end

      it 'prints as many "Pop" as necessary' do
        expect(output).to receive(:puts).with('Pop').exactly(10).times
        expect(output).to receive(:puts).exactly(90).times
        run.call(output)
      end

      it 'prints as many "CracklePop" as necessary' do
        expect(output).to receive(:puts).with('CracklePop').exactly(4).times
        expect(output).to receive(:puts).exactly(96).times
        run.call(output)
      end
    end
  end
end
