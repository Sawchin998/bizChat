class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  enum :gender, { male: 0, female: 1, others: 2 }
  validates :email, format: { with: /\A[\w+\-.]+@bajratechnologies.com\z/i,
    message: "Only Bajra Technologies email addresses are allowed" }
  validates :name, presence: true, length: { minimum: 2 }
  validates :gender, presence: true
  validates :password, length: { minimum: 8 }
end
