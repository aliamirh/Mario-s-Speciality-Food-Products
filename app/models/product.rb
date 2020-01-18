class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, :cost, :country_of_origin, presence: true

  before_save(:titleize_product)

  scope :made_in_usa, -> { where(country_of_origin: "usa",country_of_origin: "USA")}

  scope :most_recent, -> { order(created_at: :desc).limit(3)}

  scope :most_reviewed, -> {(
    select("products.id, products.name, products.country_of_origin, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1))}

    private
    def titleize_product
      self.name = self.name.titleize
    end
  end
