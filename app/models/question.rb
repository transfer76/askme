class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User'

  validates :text, :user, presence: true, length: { maximum: 255 }
end
