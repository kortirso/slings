require 'babosa'
require 'open-uri'

class Product < ApplicationRecord
    extend FriendlyId

    mount_uploader :image, ItemsUploader

    friendly_id :slug_candidates, use: :slugged

    belongs_to :category
    belongs_to :event

    has_many :positions
    has_many :carts, through: :positions

    validates :name, presence: true, uniqueness: true
    validates :category_id, presence: true
    validates :price, :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    scope :sales_hits, -> { where sales_hit: true }
    scope :new_ones, -> { where new_one: true }

    def is_new_product?
        new_one
    end

    def is_sales_hit?
        sales_hit
    end

    def is_available_for_order?
        amount > 0
    end

    def slug_candidates
        [:name, [:name, :id]]
    end

    def normalize_friendly_id(input)
        input.to_s.to_slug.normalize(transliterations: :russian).to_s
    end

    def self.build(args)
        product = Product.new args[:params]
        File.open(Product.download_image(args[:image])) { |f| product.image = f }
        product.save
        product
    end

    private

    def self.download_image(image)
        download = open(image)
        temp_file = "#{Rails.root}/public/uploads/#{download.to_s.split('/')[-1]}"
        IO.copy_stream(download, temp_file)
        temp_file
    end
end
