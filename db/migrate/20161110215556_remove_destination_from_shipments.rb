class RemoveDestinationFromShipments < ActiveRecord::Migration[5.0]
  def change
    remove_column :shipments, :destination, :string
  end
end
