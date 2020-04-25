# frozen_string_literal: true

require 'rails_helper'

describe CurrentRate do
  describe '.price_for_usd' do
    context 'when only central bank rate is present' do
      before do
        FactoryBot.create(:central_bank_rate, price: 70)
      end

      it 'returns central bank rate' do
        expect(described_class.price_for_usd).to eq 70
      end
    end

    context 'when only active forced rate is present' do
      before do
        FactoryBot.create(:forced_rate, price: 71, expire_at: 1.hour.from_now)
      end

      it 'returns active forced rate' do
        expect(described_class.price_for_usd).to eq 71
      end
    end

    context 'when only expired forced rate is present' do
      before do
        FactoryBot.create(:forced_rate, price: 71, expire_at: 1.second.from_now)
        sleep 1
      end

      it 'returns nil' do
        expect(described_class.price_for_usd).to be_nil
      end
    end

    context 'when central bank rate and active forced rate are present' do
      before do
        FactoryBot.create(:central_bank_rate, price: 70)
        FactoryBot.create(:forced_rate, price: 71, expire_at: 1.hour.from_now)
      end

      it 'returns active forced rate' do
        expect(described_class.price_for_usd).to eq 71
      end
    end

    context 'when central bank rate and expired forced rate are present' do
      before do
        FactoryBot.create(:central_bank_rate, price: 70)
        FactoryBot.create(:forced_rate, price: 71, expire_at: 1.second.from_now)
        sleep 1
      end

      it 'returns central bank rate' do
        expect(described_class.price_for_usd).to eq 70
      end
    end
  end
end
