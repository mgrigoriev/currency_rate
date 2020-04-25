# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @usd_rate = CurrentRate.for_usd
  end
end
