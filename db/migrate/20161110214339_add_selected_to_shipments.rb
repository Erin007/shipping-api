class AddSelectedToShipments < ActiveRecord::Migration[5.0]
  def change
    add_column :shipments, :selected?, :boolean
  end
end
