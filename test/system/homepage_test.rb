require "application_system_test_case"

class HomepageTest < ApplicationSystemTestCase
  test "homepage renders each section heading" do
    visit root_path

    assert_text "Book your first session with Julie"
    assert_text "Feel fitter, move better, and build habits that last beyond a short challenge."
    assert_text "Three coaching paths, one clear goal: helping you stay consistent."
    assert_text "A coaching approach built for real life, not all-or-nothing motivation."
    assert_text "Julie brings together encouragement, expertise, and clear next steps."
    assert_text "Questions people ask before they book."
    assert_text "Ready to train with more confidence and less guesswork?"
  end
end
