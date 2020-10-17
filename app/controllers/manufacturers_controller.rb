class ManufacturersController < ApplicationController
    # before_action :require_log_in, only: [:show]
    before_action :is_admin?

    def index
        @manufacturers = Manufacturer.all
    end
      
    def new
        @manufacturer = Manufacturer.new
    end

    def create
        @manufacturer = Manufacturer.create(manufacturer_params)
        if @manufacturer.save
            session[:manufacturer_id] = @manufacturer_id
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
        manufacturer_helper
    end 

    def update
        manufacturer_helper
        @manufacturer.update(manufacturer_params)
        if @manufacturer.save
            redirect_to manufacturers_path(@manufacturer)
        else 
            render :edit 
        end 
    end

    def destroy
        manufacturer_helper
        @manufacturer.destroy
        redirect_to manufacturers_path
    end

    private 

    def manufacturer_params
        params.require(:manufacturer).permit(:name, :bio, :established)
    end

    def manufacturer_helper
        @manufacturer = Manufacturer.find_by(params[:id])
    end

    def is_admin?
        redirect_to root_path unless current_user.admin? 
    end

end