require 'test_helper'

class DonorTest < ActiveSupport::TestCase
   d = Donor.new
	# This test should fail if no first name given
   test "Provide a first name" do
      assert_not_nil d.first_name, "No first name given"
   end

   # This test should also fail if no last name given
   test "Provide a last name" do
      assert_not_nil d.last_name, "No last name given"
   end

   # Check for first name - this should pass
   test "first name validation" do
      d.first_name = "Koffi"
      assert_not_nil d.first_name, "No first name given - should have passed"
   end

   # Check for last name - should pass
   test "last name validation" do
	   d.last_name = "wodome"
	   assert_not_nil d.last_name, "No last name given - should have passed"
   end

   # Validate for both first and last name
   test "empty string" do
	   d.last_name = "Koffi 4"

      # Check for a name regardless of case
	   assert_match /[a-z]/i, d.last_name, "Name cant be null"
   end

   # Make sure the first name isn't all numbers
   test "first name isnt numbers" do
      d.first_name = 4
      assert_match /[a-z]/i, d.last_name, "The first name can't be a number"
   end

   test "for email" do
      t = d.user(:email)
      t = "helo"
      assert_nil d.users
   end

   # Test my validation method
   test "custom validation" do
      d.first_name = "koffi"
      assert d.valid?, "First name is not valid"
   end
end
