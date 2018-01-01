# Represents configs of application
class Config < ApplicationRecord
    def self.sling_additional_price
        Config.last.price_full
    end

    def self.mai_additional_price
        Config.last.price_mai_full
    end
end
