require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @base_title = "10 Best SF"
    @category = Category.new(name: "Example Category")
 	@category.save
 	@company = Company.new(name: "Example Company", category: @category.id, city: "SF" )
    @company.save    
    @search_str =  "Exam"  	
  end

  test "should get home" do
    get home_url
    assert_response :success
    assert_select 'title', "Best of SF City Guide | Top Restaurants Bars & Events | #{@base_title}"
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select 'title', "About Us | What We Do | #{@base_title}"
  end

  test "should get place" do
    get place_url(@company.id, 1)
    assert_response :success
    assert_select 'title', "PLACE NAME | Top Brunch in SF | #{@base_title}"
  end

  test "should get search" do
  	get search_url, params: { search: @search_str, search_select: @category.id }
  	assert_response :success
  	assert_select 'title', "SEARCH | \"#{@search_str}\" | #{@category.name} | #{@base_title}"
  end

  test "should get ranking" do
    get ranking_url(@category.id)
    assert_response :success
    assert_select 'title', "Best Brunch in SF | Top Brunch Restaurant SF | #{@base_title}"
  end
end
