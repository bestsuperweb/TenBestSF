require 'test_helper'

class SubCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@category = categories(:one)
    @sub_category = @category.sub_categories.build(name: "Example SubCategory")
  end

  test "should be valid" do
    assert @sub_category.valid?
  end

  test "name should be present" do
    @sub_category.name = "     "
    assert_not @sub_category.valid?
  end

  test "category_id should be present" do
    @sub_category.category_id = nil
    assert_not @sub_category.valid?
  end


end
