require_relative 'bike_container'

class Garage

	include BikeContainer

	def initialize(bikes=[], capacity=400)
		@bikes = bikes
		@capacity = capacity
	end

	def fix_bikes
		broken_bikes.each {|bike| bike.fix!}
	end

end
