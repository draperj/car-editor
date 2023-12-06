require "application_system_test_case"

class CarsTest < ApplicationSystemTestCase
  setup do
    login_as users(:jd)
    @Car = Car.ordered.third
  end

  test "Showing a Car" do
    visit cars_path
    click_link @Car.name

    assert_selector "h1", text: @Car.name
  end

  test "Creating a new Car" do
    visit cars_path
    assert_selector "h1", text: "Cars"

    click_on "New car"
    fill_in "Name", with: "Capybara Car"

    assert_selector "h1", text: "Cars"
    click_on "Create car"

    assert_selector "h1", text: "Cars"
    assert_text "Capybara Car"
  end

  test "Updating a Car" do
    visit cars_path
    assert_selector "h1", text: "Cars"

    click_on "Edit", match: :first
    fill_in "Name", with: "Updated Car"

    assert_selector "h1", text: "Cars"
    click_on "Update car"

    assert_selector "h1", text: "Cars"
    assert_text "Updated Car"
  end

  test "Destroying a Car" do
    visit cars_path
    assert_text @Car.name

    click_on "Delete", match: :first
    assert_no_text @Car.name
  end
end