require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @company = Company.new(name: "Example Company", category: 1, subcategory: 2, city: 'Toronto')
  end

  test "should be valid" do
    assert @company.valid?
  end

  test "name should be present" do
    @company.name = nil
    assert_not @company.valid?
  end

  test "category should be present" do
    @company.category = nil
    assert_not @company.valid?
  end

  test "city should be present" do
    @company.city = "     "
    assert_not @company.valid?
  end

  test "name should be unique" do
    duplicate_company = @company.dup
    duplicate_company.name = @company.name
    @company.save
    assert_not duplicate_company.valid?
  end

end
