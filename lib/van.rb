require_relative 'bike_container'

class Van
	include BikeContainer
	alias :fixed_bikes :available_bikes
	alias :load :dock
	attr_reader :bikes

	def initialize(bikes=[])
		@bikes = bikes
	end

	def pickup_broken_bikes_from(place)
		@bikes.concat(place.release_broken_bikes)
	end

end