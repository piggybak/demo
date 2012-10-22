Piggybak.config do |config|
  #config.payment_calculators = ["..."]

  #config.shipping_calculators = ["..."]
  config.shipping_calculators << "Pickup" #= config.shipping_calculators + "Pickup"

  #config.tax_calculators = ["..."]

  config.default_country = "US"

  config.activemerchant_mode = :test

  config.whois_url = "http://www.infosniper.net/index.php?ip_address="

  config.logging = true
end
