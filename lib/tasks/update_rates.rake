require 'uri'
require 'net/http'

desc 'Print reminder about eating more fruit.'
task update_rates: :environment do
  url = URI('https://api.apilayer.com/fixer/latest?')

  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request['apikey'] = 'UghedvrG1TExQ71PIZOhZ5u9Nyep3nr3'

  response = https.request(request)
  rates = JSON.parse(response.body)['rates']
  rates.each do |rate|
    Currency.create(name: rate[0], rate: rate[1])
  end
end
