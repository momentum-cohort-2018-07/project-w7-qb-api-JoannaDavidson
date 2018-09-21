class Answer < ApplicationRecord
  belongs_to :whiner
  belongs_to :whine
  has_one_attached :answer_image
  acts_as_votable
  include PgSearch
  pg_search_scope :search_by_body, :against => :body
end
