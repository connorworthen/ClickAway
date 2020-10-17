class ReviewsController < ApplicationController
    
    def new
        review_helper
        @product = Product.find_by(params[:id])
        @products = Product.all
        @review = Review.new
    end 

    def create 
        review_helper
        @review = Review.create(review_params)
        if @review.save 
            redirect_to '/'
        else 
            render :new
        end 
    end 

    def show
    end 

    def destroy
        @review = Review.find_by(params[:id])
        @review.destroy
        redirect_to products_path(@product)
    end 

    private

    def review_params
        params.require(:review).permit(:product_id, :rating, :comment, :user_id )
    end

    def review_helper
        params[:product_id] && @product = Product.find_by_id(params[:product_id])
    end


end