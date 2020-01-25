require 'rails_helper'

describe "product page" do

  it "verifies the product page" do
    visit('/')
    expect(page).to have_content 'No new products to show.'
    expect(page).to have_content 'Products'
  end

  it "click on Sign up and create account" do
    visit('/')
    click_on "Sign up"
    expect(page).to have_content "Email"
    expect(page).to have_content "Password"
    fill_in "user[email]", :with => 'test11@test11.com'
    fill_in "Password", :with => '123'
    fill_in "Password confirmation", :with => '123'
    check "user[admin]"
    click_on "Sign up"
    visit '/'
    click_on "Create new product"
  end

  it "click on sign in and redirect back to sign in page" do
    visit('/')
    click_on "Sign in"
    fill_in "Email", :with => 'test1@test1.com'
    fill_in "Password", :with => '123'
    expect(page).to have_content "Sign in"
  end

  it "should click on Create new product link and redirect back to root page" do
    visit('/')
    click_on "Create new product"
    expect(page).to have_content "Products"
  end
end
