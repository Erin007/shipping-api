class RemoveOriginFromShipments < ActiveRecord::Migration[5.0]
  def change
    remove_column :shipments, :origin, :string
  end
end
