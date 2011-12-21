# Webmetrics API Wrapper

Wraps the [Webmetrics](http://www.webmetrics.com/) API. 

```ruby
require 'webmetrics'

@wm = Webmetrics::API.new :api_key => 'foo', :username => 'bar'

@wm.request :method => 'maintenance.getServices' do |res, io|
  # res is a parsed Ruby Hash containing the API response
  # io is a StringIO from Open-URI
end
```

Right now it offers one method, `request`. After you instantiate the wrapper, you call `request` passing in the name of the method you want to call, and any other URL parameters.

Works on Ruby 1.9
