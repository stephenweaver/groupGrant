require 'test_helper'

class BusinessTest < ActiveSupport::TestCase
	b = Business.new
   test "validate name - fail" do 
       assert b.name, "No name provided"
   end

   test "validate name - pass" do
      b.name = "Radio Shack"
      assert b.name, "No name provided"
   end

   test "required business attributes - fail" do
   	   assert b.valid?, "invalid parameters"
   end

 
end