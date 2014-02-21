# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
charityNames = ["Save the whales", "Support me", "Man's best friend", "hi", "what"]
emails = ["koffi@groupgrant.com", "alex@groupgrant.com", "stephen@groupgrant.com",
		  "gordon@groupgrant.com", "danny@groupgrant.com", "chris@groupgrant.com",
		  "charity@groupgrant.com", "business@groupgrant.com", "donor@groupgrant.com"]
password = "groupgrant"
Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)