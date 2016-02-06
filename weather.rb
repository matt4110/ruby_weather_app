require 'rubygems'
require 'weatherboy'

puts "For current weather conditions and a 4 day forecast please enter your zipcode"
zipcode = gets.chomp.to_i


def current_conditions(zip)
	location = Weatherboy.new(zip)
	conditions = location.current.weather
	temp = location.current.temp_f

	if conditions == "Clear"
		puts "Right now its #{temp} with no clouds in sight!"
	elsif conditions == "Mostly Cloudy"
		puts "Right now its #{temp} and cloudy, bummer!"
	elsif conditions.include? "snow"
		puts "Brrrr! its #{temp} with snow falling!"
	elsif conditions.include? "rain"
		puts "Right now its #{temp} and unfortunately rainy."
	else
		puts "Right now its #{temp} and #{conditions}"
	end
end

current_conditions(zipcode)

forecast = Weatherboy.new(zipcode).forecasts

i = 1

while (i < 5)
	day = forecast[i].title
	cond = forecast[i].conditions
	high = forecast[i].high_f

	puts "#{day} it will be #{cond} with a high of #{high}"

	i += 1
end

		