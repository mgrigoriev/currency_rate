# frozen_string_literal: true

module Admin
  class ForcedRatesController < ApplicationController
    CURRENCY = 'USD'

    before_action :load_forced_rate, only: %i[edit update]

    def new
      @forced_rate = ForcedRate.new(currency: CURRENCY)
    end

    def edit
      redirect_to new_admin_forced_rate_path if @forced_rate.blank?
    end

    def create
      @forced_rate = ForcedRate.new(forced_rate_params.merge(currency: CURRENCY))

      if @forced_rate.save
        redirect_to_success
      else
        render :new
      end
    end

    def update
      if @forced_rate.update(forced_rate_params)
        redirect_to_success
      else
        render :edit
      end
    end

    private

    def forced_rate_params
      params.require(:forced_rate).permit(:price, :expire_at)
    end

    def load_forced_rate
      @forced_rate = ForcedRate.find_by(currency: CURRENCY)
    end

    def redirect_to_success
      message = "Курс #{CURRENCY} успешно установлен"

      redirect_to admin_root_path, flash: { success: message}
    end
  end
end
