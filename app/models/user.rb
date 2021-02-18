class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #mudar pra 6 ou mais depois
  paginates_per 3

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
