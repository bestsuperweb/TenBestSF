require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @category = Category.new(name: "Example Category")
  end

  test "should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = "     "
    assert_not @category.valid?
  end

  test "name should be unique" do
    duplicate_category = @category.dup
    duplicate_category.name = @category.name
    @category.save
    assert_not duplicate_category.valid?
  end

  test "associated sub_categories should be destroyed" do
    @category.save
    @category.sub_categories.create!(name: "Example Sub Category")
    assert_difference 'SubCategory.count', -1 do
      @category.destroy
    end
  end
end
