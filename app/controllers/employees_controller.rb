class EmployeesController < ApplicationController
 before_action :set_employee, only: [:show, :edit, :update, :destroy]
  
  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new employee_params
    if @employee.save
      return redirect_to employees_path
    end
    render :new
  end

  def show
  end

 def index
    @allEmployees = Employee.all
    respond_to do |format|
      format.html
      format.csv { send_data @allEmployees.to_csv}
    end
  end

  def edit
  end

  def update
    @employee.update employee_params
    redirect_to @employee
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :lastname, :address, :phone, :salary)
  end

  def set_employee
    @employee = Employee.find params[:id]
  end
end
