# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html


# Right now, this seed file just contains data for testing. You are free to change 
# the data once you load the seed file. Let me know if you have any ideas - Koffi

# The following are the same for all accounts
description  =  "Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
				 sed do eiusmod tempor incididunt ut labore et dolore magna 
				 aliqua. Ut enim ad minim veniam, quis nostrud exercitation 
				 ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis"
password     =  "groupgrant"

# Create category for businesses and charities
cbCategories = ["Animals", "Arts and Culture", "Education", "Environment", 
				"Health", "Human Services", "International", "Public Benefit", 
				"Religion", "Other"]
cbCategories.count.times do |c|
	charity  = CharityCategory.create(name: cbCategories[c])
	business = BusinessCategory.create(name: cbCategories[c])
end				 

###################################################################################
#						Populate the database with charities 					  #
###################################################################################
charityNames = ["Feed Garfield", "Calling Missionaries", "Man's best friend", 
				"Signs for the Deaf", "Independent Gospel Outreach", 
				"This is a test account"]
charityEmail = ["feed@garfield.com", "soldout@ministries.org", "dogs@yahoo.com",
				"deafministries@yahoo.com", "IGO@missionboards.org", 
				"testcharity@groupgrant.com"]				
ein          = 12332345

# Select the charity categories
categories   = CharityCategory.all

# Create the charities and link them to a user
charityNames.count.times do |c|
	charity  = Charity.create(name: charityNames[c], eid: ++ein, description:description, 
							  video_url: "", video_url_html: "", mission_statement: "", 
							  cover_photo: nil, target_area: "", 
							  category_id: Random.rand(categories[0].id..categories.count))
	user     = User.create(email: charityEmail[c], 
						   password: password, 
						   rolable_id: charity.id, 
						   rolable_type: "Charity", 
						   phone: ""
						   is_available:1)
end

###################################################################################
#						Populate the database with businesses 					  #
###################################################################################
businessNames = ["Walmart","Target","Sam's Fun City", "Olive Garden", 
				  "Pensacola Christian College", "Pensacola State College", 
				  "Chains R Us", "Sports Authority"]
businessEmail = ["ceo@walmart.com", "nomorescams@target.org", "comeandplay@sfc.org", 
				 "italian@olivegarden.org","pcc@groupgrant.org","psc@groupgrant.org",
				 "chainsrus@groupgrant.org", "sports@groupgrant.org"]

# Select the business categories				 
categories   = CharityCategory.all

# Create the businesses
businessNames.count.times do |b|
	business  = Business.create(name: businessNames[b], goods: "", services: "", 
							    description: description, location: "",
							    category_id: Random.rand(categories[0].id..categories.count), 
							    interests: "")
	user      = User.create(email: businessEmail[b], password: password, 
							rolable_id: business.id,  rolable_type: "Business",
							phone: ""
							is_available:1)					         
end

###################################################################################
#						  Populate the database with donors 					  #
###################################################################################
# Donors
first      = ["John", "Jim", "Bob", "Joe", "Stephen", "Joshua", "Gordon", "Chris", 
		      "Michael", "Rob"]
last       =  "Smith" 
donorEmail = ["john@groupgrant.com", "jim@groupgrant.com", "Bob@groupgrant.com", 
			  "Joe@groupgrant.com", "Joshua@groupgrant.com", "Stephen@groupgrant.com", 
			  "Gordon@groupgrant.com", "chris@groupgrant.com",
			  "Michael@groupgrant.com", "Rob@groupgrant.com"]

donorEmail.count.times do |d|
	donor = Donor.create(title: "Mr.", first_name: first[d], 
						 last_name: last, middle_initial:"")
	user  = User.create(email: donorEmail[d], password: password, 
					    rolable_id: donor.id, rolable_type: "Donor", 
					    phone: "1-850-478-8496"
					    is_available:1)
end

###################################################################################
#						Populate the database with groupgrants 					  #
###################################################################################
groupgrant_categories = ["Products", "Children","Construction", "Food", 
						 "Education", "Clothing", "Animals", "Disabled", 
						 "Finance", "Environment", "Missions", "Other"]
name = "This is a test"
#groupgrant_description = "Feel free to edit it"
date = "2014-04-07"

# Create all categories
groupgrant_categories.count.times do |c|
	categories = GroupgrantCategory.create(name: groupgrant_categories[c])
end

# Create the groupgrants
categories   = GroupgrantCategory.all # Select all categories
User.where(rolable_type: "Charity").each do |c|
	groupgrant = Groupgrant.create(name: name, owner_id: c.id, partner_id: 0,
								   description: description,
								   goal_date: date, goal_amount: 
								   		Random.rand(1000..1000000),
								   video_url: "", 
								   category_id: 
								   		Random.rand(categories[0].id..categories.count))
end

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)