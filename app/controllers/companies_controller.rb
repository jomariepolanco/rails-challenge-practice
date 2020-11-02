class CompaniesController < ApplicationController
    before_action :find_company, only: [:show, :edit, :update, :destroy]
    def index
        @companies = Company.all 
        render :index 
    end

    def show
        render :show 
    end

    def new
        @company = Company.new 
        render :new 
    end

    def create
        @company = Company.create(company_params)
        if @company.valid?
            redirect_to company_path(@company)
        else
            flash[:company_errors] = @company.errors.full_messages
            redirect_to new_company_path
        end
    end

    def edit
        render :edit 
    end

    def update
        if @company.update(company_params)
            redirect_to company_path(@company)
        else
            flash[:company_errors] = @company.errors.full_messages
            redirect_to edit_company_path
        end
    end

    def destroy
        @company.destroy 
        redirect_to companies_path 
    end

    private

    def company_params
        params.require(:company).permit(:name)
    end

    def find_company
        @company = Company.find(params[:id])
    end
end