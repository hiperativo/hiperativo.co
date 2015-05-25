class Product < ActiveRecord::Base
    has_many :pictures
    attr_accessor :cover

    def cover
        self.pictures.where cover: true
    end
end
