class User < ApplicationRecord
  before_validation :normalize_name
  has_one_attached :avatar
  has_and_belongs_to_many :groups
  has_many :messages
  has_many :messages, as: :receiver
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  enum :gender, { male: 0, female: 1, others: 2 }
  validates :email, format: { with: /\A[\w+\-.]+@bajratechnologies.com\z/i,
    message: "of Bajra Technologies are allowed" }
  validates :name, presence: true, length: { minimum: 2 }
  validates :gender, presence: true
  validates :password, presence: true, length: { minimum: 8 }, if: :password_required?
 

 

  private
  def normalize_name
    self.name = name.strip if name.present?
  end

  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end
end
