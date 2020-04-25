# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @usd_price = CurrentRate.formatted_price_for_usd
  end
end
