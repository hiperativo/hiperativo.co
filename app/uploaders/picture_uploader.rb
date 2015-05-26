# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base
    storage :fog

    include CarrierWave::MiniMagick

    def store_dir
        "products/#{model.product_id}/pictures/#{model.id}"
    end

    version :thumb do
        process :resize_to_fit => [120, 100]
    end
end