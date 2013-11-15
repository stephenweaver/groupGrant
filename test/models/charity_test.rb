require "test_helper"

class CharityTest < ActiveSupport::TestCase
   
   charity = Charity.new

   test "charity eid" do   	  
   	  assert charity.valid?, "Charity invalid"
   end
end