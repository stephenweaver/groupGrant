# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

# Variables for Charities
charityNames = ["Feed Garfield", "Calling Missionaries", "Man's best friend", "Signs for the Deaf"]
description  =  "This is a test account. You may change the description."
eid          = 12332345
category     = 1

# Variables for Businesses

# Variables for Donors

# Variables for all Categories
charity_categories    = ["Animals and pets", "Education", "Non-Profit", "Missionaries","Other"]
business_categories   = ["Accounting", "Computers & Electronics", "Office", "Retail", 
	                     "Automobile", "Small Businesses", "Food", "Other"]
groupgrant_categories = ["Missions", "Wedding", "Graduation","Mission Trips", 
						 "Community Outreach", "Other"]

# Variables for users
emails   = ["koffi@groupgrant.com", "alex@groupgrant.com", "stephen@groupgrant.com",
		    "gordon@groupgrant.com", "danny@groupgrant.com", "chris@groupgrant.com",
		    "charity@groupgrant.com", "business@groupgrant.com", "donor@groupgrant.com"]
password =  "groupgrant"


# Create the charities and link them to the users
charityNames.count.times do |c|
	charity = Charity.create(name: charityNames[c], eid: ++eid, description:"", 
							 video_url: "", video_url_html: "", mission_statement: "", 
							 cover_photo: nil, target_area: "", category_id: category)
	user    = User.create(email: emails[c], password: password, rolable_id: charity.id, 
					      rolable_type: "Charity", phone: "")
end


Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)