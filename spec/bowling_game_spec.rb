require 'spec_helper'

require 'bowling_game'

RSpec.describe BowlingGame do
  describe '.score' do
    subject(:total_score) { game.rolls(rolls).score }

    let(:game) { described_class.new }

    context 'when no pins at all' do
      let(:rolls) { [0] * 20 }

      it { is_expected.to eq 0 }
    end

    context 'when single frame is won' do
      let(:rolls) { [1, 9, 5] + [0] * 17 }

      it { is_expected.to eq 20 }
    end

    context 'when all pins down by 1 strike' do
      let(:rolls) { [10] * 12 }

      it { is_expected.to eq 300 }
    end

    context 'when a newbie plays' do
      let(:rolls) { [7, 3, 4, 0, 3, 6, 8, 1, 8, 0, 5, 4, 4, 4, 5, 3, 3, 1, 8, 0] }

      it { is_expected.to eq 81 }
    end

    context 'when a middle plays' do
      let(:rolls) { [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6] }

      it { is_expected.to eq 133 }
    end

    context 'when a pro plays' do
      let(:rolls) { [9, 1, 9, 1, 9, 1, 10, 10, 10, 10, 9, 0, 10, 10, 9, 1] }

      it { is_expected.to eq 224 }
    end

    context 'when spare in last frame' do
      let(:rolls) {  [0] * 18 + [3, 7, 5] }

      it { is_expected.to eq 15 }
    end
  end
end
