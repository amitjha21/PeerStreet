#puts "Hello, Ruby!";
require 'net/http'
require 'json'

zipCodeArr = Array.new
apiHost = 'https://neon-semiotics-204505.appspot.com/'
methodName = 'getPopData'
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

url = apiHost + methodName + '?zip=' + zipCodeArr.to_s
uri = URI(url)
puts url
response = Net::HTTP.get_response(uri)
puts response.code       # => '200'
puts response.message    # => 'OK'
puts response.class.name
JSON.parse(response.body).each do |ele|
  puts ele
end