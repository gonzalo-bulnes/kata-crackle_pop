require 'spec_helper'

describe '(1..100)' do

  let(:subject) { (1..100) }

  it { is_expected.to respond_to :crackle_pop! }

  describe '#crackle_pop!' do

    let(:output) { double() }
    let(:crackle_pop) { Proc.new { subject.crackle_pop!({ crackle: 3, pop: 5 }, output) } }

    before(:each) do
      allow(output).to receive(:puts)
    end

    it { expect(&crackle_pop).not_to raise_error }

    it 'prints a message for each number' do
      expect(output).to receive(:puts).exactly(100).times
      crackle_pop.call(output)
    end

    it 'prints as many "Crackle" as necessary' do
      expect(output).to receive(:puts).with('Crackle').exactly(27).times
      expect(output).to receive(:puts).exactly(73).times
      crackle_pop.call(output)
    end

    it 'prints as many "Pop" as necessary' do
      expect(output).to receive(:puts).with('Pop').exactly(14).times
      expect(output).to receive(:puts).exactly(86).times
      crackle_pop.call(output)
    end

    it 'prints as many "CracklePop" as necessary' do
      expect(output).to receive(:puts).with('CracklePop').exactly(6).times
      expect(output).to receive(:puts).exactly(94).times
      crackle_pop.call(output)
    end

    context 'when called with { crackle: 3, pop: 7 }' do

      let(:output) { double() }
      let(:crackle_pop) { Proc.new { subject.crackle_pop!({ crackle: 3, pop: 7 }, output) } }

      before(:each) do
        allow(output).to receive(:puts)
      end

      it 'prints a message for each number' do
        expect(output).to receive(:puts).exactly(100).times
        crackle_pop.call(output)
      end

      it 'prints as many "Crackle" as necessary' do
        expect(output).to receive(:puts).with('Crackle').exactly(27).times
        expect(output).to receive(:puts).exactly(73).times
        crackle_pop.call(output)
      end

      it 'prints as many "Pop" as necessary' do
        expect(output).to receive(:puts).with('Pop').exactly(10).times
        expect(output).to receive(:puts).exactly(90).times
        crackle_pop.call(output)
      end

      it 'prints as many "CracklePop" as necessary' do
        expect(output).to receive(:puts).with('CracklePop').exactly(4).times
        expect(output).to receive(:puts).exactly(96).times
        crackle_pop.call(output)
      end
    end
  end
end
