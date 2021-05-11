class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #mudar pra 6 ou mais depois
  has_many :followers, foreign_key: "followed_id", class_name:"Relationship"
  has_many :following, foreign_key: "follower_id", class_name:"Relationship"
  
  paginates_per 6
  has_many :playlists
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :videos
  has_many :comments
  validates :email, 
    uniqueness: { message: 'Email já cadastrado.' }

  validates :username,
    uniqueness: { message: 'Nome de Usuário já cadastrado.' },
    length: { in: 3..25, 
      message: 'Nome de usuário com tamanho inválido.' }

  validates :name,
    length: { in: 3..50,
      message: 'Nome com tamanho inválido.' },
    presence: { message: 'Nome não pode ser vazio.' }

  validates :about,
      length: { maximum: 600 }
end
