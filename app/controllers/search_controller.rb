class SearchController < ApplicationController

  def search  
    if params[:search].blank?
      redirect_to root_path, notice: "Empty field!"
    else
      @products = Product.search(params[:search])
    end  
  end

end