class ItemsUploader < CarrierWave::Uploader::Base
    include CarrierWave::RMagick

    storage :file

    def store_dir
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    process resize_to_fill: [400, 400]

    version :for_catalog do
        process resize_to_fill: [200,200]
    end

    def extension_white_list
        %w(jpg png jpeg)
    end
end
