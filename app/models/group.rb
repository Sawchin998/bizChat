class Group < ApplicationRecord
  has_one_attached :avatar
  has_and_belongs_to_many :users
  has_many :messages, as: :receiver
  belongs_to :admin, class_name: "User", optional: true
end
