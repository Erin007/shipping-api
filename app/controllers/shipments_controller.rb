class ShipmentsController < ApplicationController

  def find_rates
    package = ActiveShipping::Package.new(100,  [93,10], cylinder: true)

    origin = ActiveShipping::Location.new(country: params[:origin_country] || "USA",
                                          zip:  params[:origin_zip] || "98136"
                                        )

    destination = ActiveShipping::Location.new(country: params[:destination_country] || "USA",
                                              zip: params[:destination_zip] || "46260"
                                           )

    usps = ActiveShipping::USPS.new(login: ENV["ACTIVESHIPPING_USPS_LOGIN"])

    response = usps.find_rates(origin, destination, [package])

    usps_rates = response.rates.sort_by(&:price).collect {|rate| [rate.service_name, rate.price]}

    ups = ActiveShipping::UPS.new(login: ENV["ACTIVESHIPPING_UPS_LOGIN"], password: ENV["ACTIVESHIPPING_UPS_PASSWORD"], key: ENV["ACTIVESHIPPING_UPS_KEY"])
    response = ups.find_rates(origin, destination, [package])
    ups_rates = response.rates.sort_by(&:price).collect {|rate| [rate.service_name, rate.price]}

    all_rates = usps_rates + ups_rates
    render json: all_rates

    return all_rates
  end

  def shipment_options
    find_rates().each do |rate|
      cost = rate[1]
      carrier = rate[0].split(" ")[0]
      service_name = rate[0].split(" ")[1..100].join(" ")
      Shipment.create(carrier, service_name, cost,  params[:origin_zip], params[:origin_country], params[:destination_zip],  params[:destination_country], selected )
    end
  end

end
