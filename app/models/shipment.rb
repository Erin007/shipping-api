require 'active_shipping'

class Shipment < ApplicationRecord

  def initialize
    @carrier =
    @service_name =
    @cost =
    @origin_zip =
    @origin_country =
    @destination_zip =
    @destination_country =
    @selected = false

end
