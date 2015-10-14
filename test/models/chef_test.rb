require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(chefname: "john", email: "john@example.com", password: "password")
  end
  
  test "chef should be valid" do
    assert @chef.valid?
  end
  
  test "chefname should be present" do
    @chef.chefname = ""
    assert_not @chef.valid?
  end
  
  test "chefname should not be too long" do
    @chef.chefname = "a" * 41
    assert_not @chef.valid?
  end
  
  test "chefname should not be too short" do
    @chef.chefname = "a" * 2
    assert_not @chef.valid?
  end
  
  test "email should be present" do
    @chef.email = ""
    assert_not @chef.valid?
  end
  
  test "email shoud not be too long" do
    @chef.email = "a" * 101 + "@example.com"
    assert_not @chef.valid?
  end
  
  test "email address should be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eee.au laura+joe@monk.cm]
    valid_addresses.each do |addr|
      @chef.email = addr
      assert @chef.valid?, "#{addr.inspect} should be valid"
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am_.com foo@ee+aar.com]
    invalid_addresses.each do |addr|
      @chef.email = addr
      assert_not @chef.valid?, "#{addr.inspect} should be invalid"
    end
  end
  
  test "password should be present" do
    @chef.password = nil
    assert_not @chef.valid?
  end 
  
  test "password should be long enough" do
    @chef.password = "a" * 7
    assert_not @chef.valid?
  end
  
  test "password should not be too long" do
    @chef.password = "a" * 73
    assert_not @chef.valid?
  end
  
end