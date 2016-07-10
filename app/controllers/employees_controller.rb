class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
    # @age_order = Employee.all.order_by_age
    # @dep_order = Employee.all.joins(:department).order_by_dep
    # @sal_order = Employee.all.order_by_salary
    # @retired = Employee.all.retired
    # @highsal = Employee.all.high_sal
    # @top5sal = Employee.all.top5_sal
    # @senior5 = Employee.all.senior5
    # @lowsal = Employee.all.low_sal
    # @low_senior = Employee.all.low_senior
    # @max_sal = Employee.all.max_sal
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end
  def order
    select_tag_value = params[:select_tag_value]
    if select_tag_value == "0"
      @employees_order = Employee.all
      render layout: false
    elsif select_tag_value == "1"
      @employees_order = Employee.all.order_by_age
      render layout: false
    elsif select_tag_value == "2"
      @employees_order = Employee.all.order_by_salary
      render layout: false
    elsif select_tag_value == "3"
      @employees_order = Employee.all.joins(:department).order_by_dep
      render layout: false
    elsif select_tag_value == "4"
      @employees_order = Employee.all.retired
      render layout: false
    elsif select_tag_value == "5"
      @employees_order = Employee.all.high_sal
      render layout: false
    elsif select_tag_value == "6"
      @employees_order = Employee.all.top5_sal
      render layout: false
    elsif select_tag_value == "7"
      @employees_order = Employee.all.senior5
      render layout: false
    elsif select_tag_value == "8"
      @employees_order = Employee.all.low_sal
      render layout: false
    elsif select_tag_value == "9"
      @employees_order = Employee.all.max_sal
    render layout: false
    elsif select_tag_value == "10"
      @employees_order = Employee.all.low_senior
    render layout: false
    end
  end 

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:name, :email, :age, :salary, :department_id)
    end
end
