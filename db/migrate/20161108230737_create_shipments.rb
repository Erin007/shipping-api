class CreateShipments < ActiveRecord::Migration[5.0]
  def change
    create_table :shipments do |t|
      t.string :carrier
      t.integer :cost
      t.string :service_name
      t.string :origin
      t.string :destination

      t.timestamps
    end
  end
end
