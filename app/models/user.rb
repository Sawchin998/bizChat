class User < ApplicationRecord
  before_validation :normalize_name
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  enum :gender, { male: 0, female: 1, others: 2 }
  validates :email, format: { with: /\A[\w+\-.]+@bajratechnologies.com\z/i,
    message: "of Bajra Technologies are allowed" }
  validates :name, presence: true, length: { minimum: 2 }
  validates :gender, presence: true
  validates :password, length: { minimum: 8 }

  private
  def normalize_name
    self.name = name.strip if name.present?
  end
end
