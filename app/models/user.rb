class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :videos

  validates :email, 
    uniqueness: { message: 'Email já cadastrado.' }

  validates :username,
    uniqueness: { message: 'Nome de Usuário já cadastrado.' },
    length: { in: 3..25, 
      message: 'Nome de usuário com tamanho inválido.' },
    presence: { message: 'Nome de usuário não pode ser vazio.' }

  validates :name,
    length: { in: 3..50,
      message: 'Nome com tamanho inválido.' },
    presence: { message: 'Nome não pode ser vazio.' }
end
