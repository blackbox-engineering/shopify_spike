class AddTokenAndStateToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :merchant_token, :string
    add_column :shops, :enabled, :boolean
  end
end
