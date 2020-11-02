class OfficesController < ApplicationController
    before_action :find_office, only: [:show, :edit, :update, :destroy]
    def index
        @offices = Office.all 
        render :index 
    end

    def show
        render :show 
    end

    def new
        @office = Office.new 
        render :new 
    end

    def create
        @office = Office.create(office_params)
        if @office.valid?
            redirect_to office_path(@office)
        else
            flash[:office_errors] = @office.errors.full_messages
            redirect_to new_office_path
        end
    end

    def edit
        render :edit 
    end

    def update
        if @office.update(office_params)
            redirect_to office_path(@office)
        else
            flash[:office_errors] = @office.errors.full_messages
            redirect_to edit_office_path
        end
    end

    def destroy
        @office.destroy 
        redirect_to offices_path 
    end

    private

    def office_params
        params.require(:office).permit(:building_id, :company_id, :floor)
    end

    def find_office
        @office = Office.find(params[:id])
    end
end