require 'spec_helper'

describe CracklePop do

  it { is_expected.to respond_to :run }
  
  describe '#run' do

    let(:run) { Proc.new { subject.run } }

    it { pending 'Not yet implemented'; expect(&run).not_to raise_error }
  end
end

