require 'test_helper'

class ReviewTest < ActiveSupport::TestCase  
  def setup
    @chef = Chef.new(chefname: "john", email: "john@example.com", password: "password")
    @chef2 = Chef.new(chefname: "jacob", email: "jacob@example.com", password: "password")

    @recipe1 = @chef.recipes.build(name: "Test Recipe 1", summary: "This is the best ever.", description: "Put your stuff together and cook it")
    @recipe2 = @chef.recipes.build(name: "Test Recipe 2", summary: "This is 2nd the best ever.", description: "Put your stuff together and cook it--same deal")
    
#    @review11 = @recipe1.new(chef: @chef1, summary: "Review1", description: "Review description 1")
#    @review12 = @recipe1.new(chef: @chef2, summary: "Review1", description: "Review description 1")
  end


  test "should be valid" do
    #ToDo: stub out session login with helper to allow testing of logged-in only features.
  end
    
  end
  # should be signed in to create review
  # should be able to create review
  # should be able to see reviews without signing in
  # should be able to edit own reviews
  # should be able to delete own reviews
  # should be able to delete any review if admin
  # should have summary
  # should have description
  # should be not more than one review per chef per recipe
  # should see current_user review for recipe if it exists
  # can have more than one reviewer per recipe
  