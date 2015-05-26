class Product < ActiveRecord::Base
    has_many :pictures

    def cover
        if self.pictures.where(cover: true).any?
            self.pictures.where(cover: true).file
        elsif self.pictures.any?
            self.pictures.last.file
        else
            ActionController::Base.helpers.asset_path "image-placeholder.png"
        end
    end
end