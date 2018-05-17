#puts "Hello, Ruby!";
require 'net/http'
require 'json'

#url = 'https://api.spotify.com/v1/search?type=artist&q=tycho'
#url = 'https://jsonplaceholder.typicode.com/posts/1'
url = 'http://localhost:3000/getPopData'
uri = URI(url)
response = Net::HTTP.get(uri)
puts response