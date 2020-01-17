class Review < ApplicationRecord
  belongs_to :product

  validates :author,:content_body, :rating, :product_id, presence: true
  validates_length_of :content_body, minimum:50, maximum: 250
end
