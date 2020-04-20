require 'spec_helper'

require 'bowling_game'

describe BowlingGame do
  subject { game.score }

  let(:game) { described_class.new pins }

  context 'when no pins at all' do
    let(:pins) { Array.new(20) { 0 } }

    it { is_expected.to eq 0 }
  end
end
