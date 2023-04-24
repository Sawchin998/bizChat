class Message < ApplicationRecord
  before_validation :normalize_content
  belongs_to :user
  belongs_to :receiver, polymorphic: true
  has_many_attached :images
  # validates :content, presence: true, if: :content_required?

  private
  def normalize_content
    self.content = content.strip if content.present?
  end

  # def content_required?
  #   !self.images.present?
  # end
end
