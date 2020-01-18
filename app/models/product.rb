class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, :cost, :country_of_origin, presence: true

  before_save(:titleize_product)

  scope :made_in_usa, -> { where(country_of_origin: "usa",country_of_origin: "USA")}

  scope :most_recent, -> { order(created_at: :desc).limit(3)}


    private
    def titleize_product
      self.name = self.name.titleize
    end
  end
