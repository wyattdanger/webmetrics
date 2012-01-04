# Webmetrics API Wrapper

Wraps the [Webmetrics API](http://help.webmetrics.com/help/API_Documentation.html). 

```ruby
require 'webmetrics'

wm = Webmetrics::API.new :api_key => 'foo', :username => 'bar'

# example with 'maintenance.getServices'
wm.request :method => 'maintenance.getServices' do |data|
  # data is a parsed Ruby Hash containing the API response
end

# example with 'processeddata.getdata'
wm.request({
    :method => 'processeddata.getdata',
    :sday => 1,
    :smonth => 1,
    :syear => 2012,
    :eday => Time.now.day,
    :emonth => Time.now.month,
    :eyear => Time.now.year,
    :serviceid => "YOUR_SERVICE_ID(s)"
    }) do |data|
      # do stuff with data
    end
```

Right now it offers one method, `request`. After you instantiate `Webmetrics::API`, you call `request` passing in a hash containing the name of the method you want to call, and any other URL parameters. `request` gives you a block with the API response as a Ruby `Hash`. The gem takes care of passing your username and the `sig` parameter for you.

Works on Ruby 1.9
