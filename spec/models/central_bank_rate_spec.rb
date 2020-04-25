# frozen_string_literal: true

require 'rails_helper'

describe CentralBankRate do
  it { is_expected.to validate_presence_of(:currency) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_numericality_of(:price).is_greater_than(0.0) }
end
