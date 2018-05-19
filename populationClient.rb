require 'net/http'
require 'json'

class Population

  @@api_host = 'https://neon-semiotics-204505.appspot.com/'
  @@method_name = 'getPopData'

  def get_zip_code
    zip_code_array = Array.new
    puts 'Enter Zip Code:'
    result = ""

    until result == "q"
      print">"
      result = gets.chomp
      if result == 'q'
        puts "\nCalling API to get Population Data..."
      else
        zip_code_array.push(result)
        puts "You entered zip code: #{result}. Press 'q' to see the result or input another Zip Code"
      end
    end
    return zip_code_array
  end

  def request_data(zip_code_array)
    url = @@api_host + @@method_name + '?zip=' + zip_code_array.to_s
    uri = URI(url)
    begin
      response = Net::HTTP.get_response(uri)
      return response
    rescue
      puts "Error: Could not connect to Google cloud platform!"
      puts "Exiting Ruby Client..."
      exit(1)
    end

  end

  def print_population_data(pop_data_response)
    if pop_data_response.code == '200'
      puts 'Population data successfully retrieved'
    else
      puts 'Error: Could not retrieve data from Node API'
      puts "Exiting Ruby Client..."
      exit(1)
    end
    pop_json_data = JSON.parse(pop_data_response.body)
    puts "\n<------------START--------------->"
    pop_json_data.each do |ele|
      puts "     Details for "+ ele["Zip"]
      puts 'Zip ==> ' + ele['Zip']
      puts 'CBSA ==> ' + ele['CBSA']
      puts 'MSA ==> ' + ele['MSA']
      puts 'Population 2015 ==> ' + ele['Pop2015'].to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
      puts 'Population 2014 ==> ' + ele['Pop2014'].to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
      growth_percent = ((ele['Pop2015'].to_i - ele['Pop2014'].to_i).to_f / ele['Pop2014'].to_i).to_f * 100
      puts 'Population Growth ==> ' + '%.2f' % growth_percent + '%'
      puts "----------------------------------"
    end
    puts '<--------------END--------------->'
  end
end

# Main block to initiate program
pop = Population.new
zip_array = pop.get_zip_code
population_data_response = pop.request_data(zip_array)
pop.print_population_data(population_data_response)

