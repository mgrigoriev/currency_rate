class CreateForcedRates < ActiveRecord::Migration[6.0]
  def change
    create_table :forced_rates do |t|
      t.string :currency, null: false, index: { unique: true }
      t.decimal :price, precision: 10, scale: 4, null: false
      t.datetime :expire_at, null: false

      t.timestamps null: false
    end
  end
end
