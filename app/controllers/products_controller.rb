class ProductsController < ApplicationController
    before_action :is_admin?, expect: [:index, :show]

    def index
        product_helper
        @products = Product.all
    end

    def show
        product_helper
        @products = Product.all
    end

    def new
        @manufacturer = Manufacturer.find_by(params[:id])
        @product = Product.new 
    end 
    
    def create
        @product = Product.new(product_params)
        if @product.save
            # @product.update(user_ids: current_user.id)
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
        product_helper
    end 

    def update
        product_helper
        @product.update(product_params)
        if @product.save
            redirect_to products_path(@product)
        else 
            render :edit 
        end 
    end

    def destroy
        product_helper
        @product.destroy
        redirect_to products_path
    end

    private 

    def product_params
        params.require(:product).permit(:name, :price, :stock, :description, :manufacturer_id, manufacturer_attributes: [:name])
    end 

    def product_helper
        @product = Product.find_by(params[:id])
    end

    def is_admin?
        redirect_to root_path unless current_user.admin? 
    end

end