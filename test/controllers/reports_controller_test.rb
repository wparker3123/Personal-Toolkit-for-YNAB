require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get groupedbycategory" do
    get reports_groupedbycategory_url
    assert_response :success
  end
end
