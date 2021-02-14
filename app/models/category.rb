class Category < ApplicationRecord
  has_many :video_categories
  has_many :videos, through: :video_categories

  paginates_per 5

end
