class Video < ApplicationRecord
  belongs_to :user
  has_one_attached :video_file
  has_many :comments, as: :commentable
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :video_categories
  has_many :categories, through: :video_categories
  belongs_to :playlist
  is_impressionable
  paginates_per 8
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history, :finders]

  validates :title, 
    length: { in: 3..150, message: 'O título deve ser conciso.' },
    presence: true
  validates :description,
    length: { in: 3..1000, message: 'Dê um resumo de sua aula.' },
    presence: true
  validates :video_file, presence: true,
    blob: { content_type: ['video/mp4'], size_range: 1..600.megabytes }

  def should_generate_new_friendly_id?
    title_changed?
  end
  
end
