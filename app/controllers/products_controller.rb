class ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def show
    end

    def create
        Product.create params.permit :name, :description
        redirect_to action: :index
    end

    def destroy
    end

    def update
    end
end
