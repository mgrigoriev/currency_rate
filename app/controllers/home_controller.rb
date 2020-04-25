# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @usd_rate = CentralBankRate.for_usd.last
  end
end
