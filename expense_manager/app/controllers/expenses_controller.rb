class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update_attributes(expense_params)
      redirect_to expenses_path
    else
      render :edit
    end
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to expenses_path
    else
      render :new
    end
  end

  def destroy
  end

  private
  def expenses_params 
    params.require(:expense).permit(:value, :date_exp, :description, :category_id, :city_id, :user_id)
  end
end
