class ShipmentsController < ApplicationController

  def find_rates
    package = ActiveShipping::Package.new(100,  [93,10], cylinder: true)

    origin = ActiveShipping::Location.new(country: 'US',
                                      state: 'CA',
                                      city: 'Beverly Hills',
                                      zip: '90210')

    destination = ActiveShipping::Location.new(country: 'CA',
                                           province: 'ON',
                                           city: 'Ottawa',
                                           postal_code: 'K1P 1J1')

    usps = ActiveShipping::USPS.new(login: '677JADED7283')
    response = usps.find_rates(origin, destination, [package])

    render json: response
  end

end

#Do this for each of the postal services you want to use, include the params for each of the things and hide the secrets and keys in the .env file
