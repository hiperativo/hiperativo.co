class ProductsController < ApplicationController
    def index
        @products = Product.all
        if request.xhr?
            render @products
        else
            render
        end
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
        p = Product.find params["id"]
        p.update_attribute params["field"], params["value"]
        p.save
        render nothing: true, status: 200
    end
end
