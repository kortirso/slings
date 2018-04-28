# Represents configs of application
class Config < ApplicationRecord
  class << self
    def sling_additional_price
      Config.last.price_full
    end

    def mai_additional_price
      Config.last.price_mai_full
    end
  end
end
