class CreateCentralBankRates < ActiveRecord::Migration[6.0]
  def change
    create_table :central_bank_rates do |t|
      t.string :currency, null: false, index: true
      t.decimal :price, precision: 10, scale: 4, null: false
      t.datetime :created_at, null: false
    end
  end
end
