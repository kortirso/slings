require 'babosa'
require 'open-uri'

# Represents products
class Product < ApplicationRecord
    extend FriendlyId

    mount_uploader :image, ItemsUploader

    friendly_id :slug_candidates, use: :slugged

    belongs_to :category
    belongs_to :collection, optional: true

    has_many :positions, dependent: :destroy
    has_many :carts, through: :positions

    validates :name, presence: true
    validates :category_id, presence: true
    validates :price, :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :material, presence: true, inclusion: { in: %w[Лён Хлопок] }, allow_blank: true
    validates :model, presence: true, inclusion: { in: %w[Стандарт Супер-М Тодлер] }, allow_blank: true

    scope :sales_hits, -> { where sales_hit: true }
    scope :new_ones, -> { where new_one: true }
    scope :lasts, -> { order(created_at: :desc) }

    def available_for_order?
        amount > 0
    end

    def slug_candidates
        [:name, %i[name id]]
    end

    def normalize_friendly_id(input)
        input.to_s.to_slug.normalize(transliterations: :russian).to_s
    end

    def additional_price
        category_name = category.name
        return Config.sling_additional_price if category_name.include?('Эрго-рюкзаки')
        return Config.mai_additional_price if category_name.include?('Май-слинги')
        0
    end

    def self.build(args)
        product = Product.new args[:params]
        File.open(Product.download_image(args[:image])) { |f| product.image = f }
        product.save
        product
    end

    def self.download_image(image)
        download = open(image)
        temp_file = "#{Rails.root}/public/uploads/#{download.to_s.split('/')[-1]}"
        IO.copy_stream(download, temp_file)
        temp_file
    end
end
