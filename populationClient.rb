#puts "Hello, Ruby!";
require 'net/http'
require 'json'

#url = 'https://api.spotify.com/v1/search?type=artist&q=tycho'
#url = 'https://jsonplaceholder.typicode.com/posts/1'
zipCodeArr = Array.new
# zipCode = ['79311','32003']
puts 'Enter Zip Code:'
result = ""
until result == "q"
  print">"
  result = gets.chomp
  if result == 'q'
    puts "Showing output:"
  else
    zipCodeArr.push(result)
    puts "You entered zip code: #{result}. Press 'q' to see the result or input another Zip Code"
  end
end

# zipCode = [zipV]
url = 'http://localhost:3000/getPopData?zip=' + zipCodeArr.to_s
uri = URI(url)
puts url
response = Net::HTTP.get_response(uri)
puts response.code       # => '200'
puts response.message    # => 'OK'
puts response.class.name
JSON.parse(response.body).each do |ele|
  puts ele
end