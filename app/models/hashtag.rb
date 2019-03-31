class Hashtag < ApplicationRecord
  has_many :hashtags_questions
  has_many :hashtags, through: :hashtags_questions

  validates :name, uniqueness: true
end
