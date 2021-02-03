class Video < ApplicationRecord
  belongs_to :user
  has_one_attached :video_file
  # has_one_attached :thumbnail
end
