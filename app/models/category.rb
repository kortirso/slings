require 'babosa'

# Represents categories
class Category < ApplicationRecord
    extend FriendlyId

    mount_uploader :image, GroupsUploader

    friendly_id :name, use: :slugged

    has_many :products, dependent: :destroy

    validates :name, presence: true, uniqueness: true

    def normalize_friendly_id(input)
        input.to_s.to_slug.normalize(transliterations: :russian).to_s
    end

    def self.category_order
        [Category.find_by(name: 'Эрго-рюкзаки (слинги-рюкзаки)')] + Category.where.not(name: 'Эрго-рюкзаки (слинги-рюкзаки)').order(name: :asc).to_a
    end
end
