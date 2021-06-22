class HousesController < ApplicationController
    before_action :not_logged_in

    def index 
        @houses = House.all
    end

    def show
        @house = House.find_by(params[:id])
        redirect_to houses_path if !@house
    end

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @house = @user.houses.build
        else
            @house = House.new
        end
    end

    def create
        @house = current_user.houses.build(house_params)
        if @house.save
            redirect_to house_path(@house)
        else
            render :new
        end
    end
    
    def destroy
    end

    private

    def house_params
        params.require(:house).permit(:name, :hex, :size, :price)
    end

end