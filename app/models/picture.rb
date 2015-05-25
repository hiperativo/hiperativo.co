class Picture < ActiveRecord::Base
    belongs_to :product
    mount_uploader :file, PictureUploader
end
