class Message < ApplicationRecord
  belongs_to :user
  belongs_to :receiver, polymorphic: true
  has_many_attached :images
end
