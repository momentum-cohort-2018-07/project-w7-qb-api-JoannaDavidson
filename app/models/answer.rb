class Answer < ApplicationRecord
  belongs_to :whiner
  belongs_to :whine
  has_one_attached :answer_image
  has_many :petulants
  acts_as_votable
end
