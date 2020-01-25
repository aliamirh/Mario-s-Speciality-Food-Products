require 'rails_helper'

describe "product page" do

  it "verifies the product page" do
    visit('/')
    expect(page).to have_content 'No new products to show.'
    expect(page).to have_content 'Products'
  end

  it "click on sign up" do
    visit('/')
    click_on "Sign up"
    expect(page).to have_content "Email"
    expect(page).to have_content "Password"
  end

  it "click on sign in" do
    visit('/')
    click_on "Sign in"
    fill_in "Email", :with => 'test1@test1.com'
    fill_in "Password", :with => '123'
    expect(page).to have_content "Sign in"
  end
end
