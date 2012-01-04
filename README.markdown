# Webmetrics API Wrapper

Wraps the [Webmetrics API](http://help.webmetrics.com/help/API_Documentation.html). 

```ruby
require 'webmetrics'

wm = Webmetrics::API.new :api_key => 'foo', :username => 'bar'

wm.request :method => 'maintenance.getServices' do |res, io|
  # res is a parsed Ruby Hash containing the API response
  # io is a StringIO from Open-URI
end
```

Right now it offers one method, `request`. After you instantiate `Webmetrics::API`, you call `request` passing in a hash containing the name of the method you want to call, and any other URL parameters. `request` gives you a block with the API response as a Ruby hash, and a [StringIO](http://ruby-doc.org/stdlib-1.9.3/libdoc/stringio/rdoc/index.html) of the response, in case you need to do anything more complicated with the response data.

Works on Ruby 1.9
