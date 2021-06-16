class HousesController < ApplicationController

    def index
        @houses = House.all
    end

    def show
    end

    def new
    end

    def create
    end
    
    def destroy
    end

    private

    def house_params
    end

end