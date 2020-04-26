# frozen_string_literal: true

require 'rails_helper'

describe ForcedRate do
  it { is_expected.to validate_presence_of(:expire_at) }
  it { is_expected.to validate_presence_of(:currency) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_numericality_of(:price).is_greater_than(0.0) }

  describe 'uniqueness' do
    subject { FactoryBot.build(:forced_rate, price: '75', expire_at: 1.hour.from_now) }

    it { is_expected.to validate_uniqueness_of(:currency) }
  end

  describe '#expire_at' do
    context 'is in the past' do
      before do
        subject { FactoryBot.build(:forced_rate, price: '75', expire_at: 1.second.ago) }
      end

      it { expect(subject).not_to be_valid  }
    end

    context 'is in the future' do
      before do
        subject { FactoryBot.build(:forced_rate, price: '75', expire_at: 1.minute.from_now) }
      end

      it { expect(subject).not_to be_valid  }
    end
  end
end
