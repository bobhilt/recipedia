require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chefname: "john", email: "john@example.com", password: "password")
#    @chef = Chef.create(chefname: "bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(name: "Chicken Parmesan", summary: "This is the best ever.", description: "Add parmesan to Mayonaiise. Coat chicken. Bake at 375 for 35 minutes.")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "name length should not be too long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end
  
  test "name length should not be too short" do
    @recipe.name = "aaaa"
    assert_not @recipe.valid?
  end

  test "summary should be present" do
    @recipe.summary = ""
    assert_not @recipe.valid?
  end
  
  
  test "summary length should not be too long" do
    @recipe.summary = "a" * 101
    assert_not @recipe.valid?
  end
  
  test "summary length should not be too short" do
    @recipe.summary = "a" * 4
    assert_not @recipe.valid?
  end
  
  test "description must be present" do
    @recipe.description = ""
    assert_not @recipe.valid?
  end
  
  test "description shoud not be too long" do
    @recipe.description = "a" * 3001
    assert_not @recipe.valid?
  end
  
  test "description can be long" do
    @recipe.description = "a" * 3000
    assert @recipe.valid?
  end
  
  
  test "- chef_d must be present" do
  end
  
end