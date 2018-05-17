#puts "Hello, Ruby!";
require 'net/http'
require 'json'

#url = 'https://api.spotify.com/v1/search?type=artist&q=tycho'
#url = 'https://jsonplaceholder.typicode.com/posts/1'
zipCode = ["2001","1111","9999"]
url = 'http://localhost:3000/getPopData?zip=' + zipCode.to_s
uri = URI(url)
response = Net::HTTP.get_response(uri)
puts response.code       # => '200'
puts response.message    # => 'OK'
puts response.class.name
puts response.body