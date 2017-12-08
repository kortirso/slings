class Instagram < ApplicationRecord
    has_many :instaphotos, dependent: :destroy
end
