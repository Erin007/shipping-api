class AddOrigincountryToShipments < ActiveRecord::Migration[5.0]
  def change
    add_column :shipments, :origin_country, :string
  end
end
