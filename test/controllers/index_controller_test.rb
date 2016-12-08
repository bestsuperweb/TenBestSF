require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @base_title = "10 Best SF"
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
    get place_url
    assert_response :success
    assert_select 'title', "PLACE NAME | Top Brunch in SF | #{@base_title}"
  end

  test "should get ranking" do
    get ranking_url
    assert_response :success
    assert_select 'title', "Best Brunch in SF | Top Brunch Restaurant SF | #{@base_title}"
  end

end
