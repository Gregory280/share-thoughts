class Video < ApplicationRecord
  belongs_to :user
  has_one_attached :video_file
  has_one_attached :material
  has_many :comments, as: :commentable
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :video_categories
  has_many :categories, through: :video_categories
  belongs_to :playlist, optional: true

  is_impressionable
  
  paginates_per 10
  
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history, :finders]

  scope :feed_for, -> (user) { where(user_id: user.following.select(:followed_id)).order(created_at: :desc)}

  validates :title, 
    length: { in: 4..130, message: 'O título deve ser conciso.' },
    presence: true
  validates :description,
    length: { in: 3..1200, message: 'Dê um resumo de sua aula.' },
    presence: true
  validates :video_file, presence: true,
    blob: { content_type: ['video/mp4'], size_range: 1..600.megabytes }
  


  def should_generate_new_friendly_id?
    title_changed?
  end
  
end
