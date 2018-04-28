require 'babosa'

# Represents articles about products
class Article < ApplicationRecord
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  def slug_candidates
    [:name]
  end
end
