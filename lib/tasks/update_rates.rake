require 'uri'
require 'net/http'

desc 'Update currency rates in the database'
task update_rates: :environment do
  url = URI('https://api.apilayer.com/fixer/latest?')

  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request['apikey'] = 'UghedvrG1TExQ71PIZOhZ5u9Nyep3nr3'

  response = https.request(request)
  rates = JSON.parse(response.body)['rates']
  rates.each do |key, value|
    currency = Currency.find_by(name: key)
    if currency
      currency.update(rate: value)
    else
      Currency.create(name: key, rate: value)
    end
  end
  puts 'Currency rates updated'
end
