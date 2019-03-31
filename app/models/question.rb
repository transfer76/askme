class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', foreign_key: "author_id", optional: true

  has_many :hashtags_questions
  has_many :hashtags, through: :hashtags_questions

  validates :text, :user, presence: true, length: { maximum: 255 }
end
