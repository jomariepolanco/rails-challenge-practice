class BuildingsController < ApplicationController
    before_action :find_building, only: [:show, :edit, :update, :destroy]
    def index
        @buildings = Building.all 
        render :index 
    end

    def show
        render :show 
    end

    def new
        @building = Building.new 
        render :new 
    end

    def create
        @building = Building.create(building_params)
        if @building.valid?
            redirect_to building_path(@building)
        else
            flash[:building_errors] = @building.errors.full_messages
            redirect_to new_building_path
        end
    end

    def edit
        render :edit 
    end

    def update
        if @building.update(building_params)
            redirect_to building_path(@building)
        else
            flash[:building_errors] = @building.errors.full_messages
            redirect_to edit_building_path
        end
    end

    def destroy
        @building.destroy 
        redirect_to buildings_path 
    end

    private

    def building_params
        params.require(:building).permit(:name, :country, :address, :rent_per_floor, :number_of_floors)
    end

    def find_building
        @building = Building.find(params[:id])
    end
end