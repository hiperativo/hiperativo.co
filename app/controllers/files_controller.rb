class FilesController < ApplicationController
    def create
        params[:product_id] = params[:id]
        params.delete :id
        puts params
        p = Picture.create params.permit(:file, :product_id)
        p.save
        render nothing: true, status: 200
    end
end