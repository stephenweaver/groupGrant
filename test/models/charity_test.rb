require "test_helper"

class CharityTest < ActiveSupport::TestCase
   
   charity = Charity.new

   test "charity eid" do
   	  charity.eid = 3
   	  assert charity.eid, "No EID supplied"
   end

	test "charity eid null" do
   	  charity.eid = nil
   	  assert charity.eid, "EID is null"
   end

   #test "eid is a string" do
   #end

   test "no charity name" do
   	  assert charity.name, "No name supplied"
   end

   test "charity name" do
   	  charity.name = "ymca"
   	  assert charity.valid?, "Invalid name"
   end

end