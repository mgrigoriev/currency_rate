# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @usd_price = CurrentRate.price_for_usd
  end
end
