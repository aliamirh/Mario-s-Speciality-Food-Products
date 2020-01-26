require 'rails_helper'

describe Review do
  it { should belong_to(:product) }
  it { should validate_presence_of :author }
  it { should validate_presence_of :content_body }
  it { should validate_presence_of :rating }
  it { should validate_presence_of :product_id }
  it { should validate_length_of(:content_body).is_at_most(250) }
end

describe (Review) do
  it("should create a review for a product") do
    product = Product.create({name: "apples", cost: 2, country_of_origin: "usa"})
    product.save
    review = product.reviews.create({author: "John Doe", content_body: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. parturient montes nec, pellentesque eu, pretium quis, sem.", rating: 5})
    review.save
    expect(Review.all).to(eq([review]))
  end

  it("should edit a review for a product") do
    product = Product.create({name: "apples", cost: 2, country_of_origin: "usa"})
    product.save
    review = product.reviews.create({author: "John Doe", content_body: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. parturient montes nec, pellentesque eu, pretium quis, sem.", rating: 5})
    review.save
    review.update({author: "Boby Bob"})
    expect(review.author).to(eq("Boby Bob"))
  end

  it("should delete a review from a product") do
    product = Product.create({name: "apples", cost: 2, country_of_origin: "usa"})
    product.save
    review = product.reviews.create({author: "John Doe", content_body: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. parturient montes nec, pellentesque eu, pretium quis, sem.", rating: 5})
    review.save
    review2 = product.reviews.create({author: "Bobby Bob", content_body: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. parturient montes nec, pellentesque eu, pretium quis, sem.", rating: 5})
    review2.save
    review.destroy
    expect(Review.all).to(eq([review2]))
  end
end
