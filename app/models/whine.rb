class Whine < ApplicationRecord
  belongs_to :whiner
  has_one_attached :whine_image
  has_many :answers
  has_many :clarifiers
  has_many :petulants, through: :answers
end
