require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url

    assert_response :success
    assert_select "section", count: 7
    assert_select "section#services"
    assert_select "section#book"
    assert_select "a", text: "Book a session", minimum: 1
    assert_match "FitnessFormula", @response.body
  end
end
