require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }
end

describe (Product) do
  it("should create a product") do
    product = Product.create({name: "apples", cost: 1, country_of_origin: "Korea"})
    product.save
    expect(Product.all).to(eq([product]))
  end

  it("should edit a product") do
    product = Product.create({name: "apples", cost: 1, country_of_origin: "America"})
    product.save
    product.update({name: "grapes"})
    expect(product.name).to(eq("grapes"))
  end

  it("should delete a product") do
    product = Product.create({name: "apples", cost: 1, country_of_origin: "United States"})
    product1 = Product.create({name: "grapes", cost: 1, country_of_origin: "Korea"})
    product.destroy
    expect(Product.all).to(eq([product1]))
  end
end
