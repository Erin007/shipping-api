class AddOriginzipToShipments < ActiveRecord::Migration[5.0]
  def change
    add_column :shipments, :origin_zip, :string
  end
end
