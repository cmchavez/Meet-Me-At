class Meetupapi < ActiveRecord::Base
	
	include HTTParty
	base_uri "https://api.meetup.com/2/open_events?"

	def self.find(name, zipcode)
		query = {
			"key"=>"3566545960a741b2a323463237503",
			"topic" => name,
			"zip"=>zipcode,
			"radius" => "10"
			"page"=> "50",
			"radius"=>"10.0",
			"desc"=>true,
			"status"=> "upcoming"
		}

		HTTParty.get(base_uri, query: query)
	end 
end

	