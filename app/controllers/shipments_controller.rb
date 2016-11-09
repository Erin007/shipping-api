class ShipmentsController < ApplicationController

  def find_rates

    package = ActiveShipping::Package.new(100,  [93,10], cylinder: true)

    origin = ActiveShipping::Location.new(country: 'US',
                                      state: 'CA',
                                      city: 'Beverly Hills',
                                      address: '1234 Palm Tree St.',
                                      zip: '90210'
                                      )

    destination = ActiveShipping::Location.new(country: 'US',
                                              state: 'WA',
                                              city: 'Seattle',
                                              address: '5678 Pine Tree St.',
                                              zip: '98136'
                                           )

    usps = ActiveShipping::USPS.new(login: ENV["ACTIVESHIPPING_USPS_LOGIN"])

    response = usps.find_rates(origin, destination, [package])

    usps_rates = response.rates.sort_by(&:price).collect {|rate| [rate.service_name, rate.price]}

    ups = ActiveShipping::UPS.new(login: ENV["ACTIVESHIPPING_UPS_LOGIN"], password: ENV["ACTIVESHIPPING_UPS_PASSWORD"], key: ENV["ACTIVESHIPPING_UPS_KEY"])
    response = ups.find_rates(origin, destination, [package])
    ups_rates = response.rates.sort_by(&:price).collect {|rate| [rate.service_name, rate.price]}

    all_rates = usps_rates + ups_rates
    render json: all_rates
  end

end


#Do this for each of the postal services you want to use, include the params for each of the things and hide the secrets and keys in the .env file
