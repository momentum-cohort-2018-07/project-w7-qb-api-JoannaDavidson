class Whine < ApplicationRecord
  belongs_to :whiner
  has_one_attached :whine_image
  has_many :answers, dependent: :destroy
  has_many :clarifiers, dependent: :destroy
end
