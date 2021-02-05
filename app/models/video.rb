class Video < ApplicationRecord
  belongs_to :user
  has_one_attached :video_file
  validates :title, 
    length: { in: 3..150, message: 'O título deve ser conciso.' },
    presence: true
  validates :description,
    length: { in: 3..1000, message: 'Dê um resumo de sua aula.' },
    presence: true
  validates :video_file, presence: true,
    content_type: [:mp4], size: { less_than: 600.megabytes, 
      message: 'Seu vídeo ultrapassou o tamanho limite.'}
end
