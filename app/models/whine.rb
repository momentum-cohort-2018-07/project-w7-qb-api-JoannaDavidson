class Whine < ApplicationRecord
  belongs_to :whiner
  has_one_attached :whine_image
  has_many :answers, dependent: :destroy
  has_many :clarifiers, dependent: :destroy
  include PgSearch
  pg_search_scope :search_by_title_body, :against => [:title, :body]
  pg_search_scope :search_all_variants,
    :against => [:title, :body],
    using: {
      tsearch: { dictionary: 'english' } # This searches all word variants
    }
  pg_search_scope :search_all_partial_matches,
    :against => [:title, :body],
    using: {
      tsearch: { prefix: true } #This enables partial word searching
    }

end
