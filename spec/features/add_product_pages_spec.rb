require 'rails_helper'

describe "product page" do
  it "verifies the product page" do
     visit('/')
   expect(page).to have_content 'No new products to show.'
   expect(page).to have_content 'Products'
   end
 end

describe "describe review page" do
  it "verifies the reviews page" do
    visit product_review_path
    expect(page).to have_content 'Reviewer:'
  end
end
