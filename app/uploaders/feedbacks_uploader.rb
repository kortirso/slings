# Image uploader for products
class FeedbacksUploader < CarrierWave::Uploader::Base
    include CarrierWave::RMagick

    storage :file

    def store_dir
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    process resize_to_fit: [100, 100]

    def extension_white_list
        %w[jpg png jpeg]
    end
end
