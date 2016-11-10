class AddDestinationzipToShipments < ActiveRecord::Migration[5.0]
  def change
    add_column :shipments, :destination_zip, :string
  end
end
