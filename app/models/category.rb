class Category < ApplicationRecord
  has_many :video_categories
  has_many :videos, through: :video_categories
  enum classification: { skills: 0, language: 1, exams: 2, level: 3, other: 4 }

end
