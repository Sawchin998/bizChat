class Group < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :messages, as: :receiver, dependent: :destroy
  belongs_to :admin, class_name: "User", optional: true
  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 8 }
end
