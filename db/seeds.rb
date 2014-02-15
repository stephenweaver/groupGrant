# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
<<<<<<< HEAD
koffi = Business.create(name: "hii", goods: "", services: "", category_id: 1, 
	description: "", phone_number: "", interests: "")

u = User.create(email: "jaes@hi.com", password: "kidsdiscover", 
	rolable_id: koffi.id, rolable_type: "Business", phone: "")
=======


Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)
>>>>>>> 3ad8ccf7065ea31df4258224ec93ea6c66c1afab
