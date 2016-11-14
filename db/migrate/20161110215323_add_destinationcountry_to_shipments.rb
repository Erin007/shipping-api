class AddDestinationcountryToShipments < ActiveRecord::Migration[5.0]
  def change
    add_column :shipments, :destination_country, :string
  end
end
