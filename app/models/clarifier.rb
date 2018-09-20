class Clarifier < ApplicationRecord
  belongs_to :whiner
  belongs_to :whine
  include PgSearch
  pg_search_scope :search_by_body, :against => :body

end
