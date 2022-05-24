class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { in: 2..20 }
  validates :email, presence: true
  validates :phone, presence: true
  validates :password, presence: true, length: { in: 6..10 }
  
end
