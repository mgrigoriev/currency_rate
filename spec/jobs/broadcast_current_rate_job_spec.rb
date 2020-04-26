# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BroadcastCurrentRateJob, type: :job do
  before do
    ActiveJob::Base.queue_adapter = :test
  end

  it 'enqueues job' do
    expect { described_class.perform_later }.to have_enqueued_job(described_class)
  end
end
