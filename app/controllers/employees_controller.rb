class EmployeesController < ApplicationController
    before_action :find_employee, only: [:show, :edit, :update, :destroy]
    def index
        @employees = Employee.all 
        render :index 
    end

    def show
        render :show 
    end

    def new
        @Employee = Employee.new 
        render :new 
    end

    def create
        @Employee = Employee.create(employee_params)
        if @employee.valid?
            redirect_to employee_path(@employee)
        else
            flash[:employee_errors] = @employee.errors.full_messages
            redirect_to new_employee_path
        end
    end

    def edit
        render :edit 
    end

    def update
        if @employee.update(employee_params)
            redirect_to employee_path(@employee)
        else
            flash[:employee_errors] = @employee.errors.full_messages
            redirect_to edit_employee_path
        end
    end

    def destroy
        @employee.destroy 
        redirect_to employees_path 
    end

    private

    def employee_params
        params.require(:employee).permit(:name, :title, :company_id)
    end

    def find_employee
        @employee = Employee.find(params[:id])
    end
end