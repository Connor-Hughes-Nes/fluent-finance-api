class BudgetController < ApplicationController
  def create
    @budget = Budget.new(budget_params)

    if @budget.save
      render json: @budget, status: :created
    else
      render json: @budget.errors, status: :unprocessable_entity
    end
  end

  def calculate_budget
    budget = params[:budget].to_f
    expense = params[:expense].to_f

    resulting_budget = budget - expense

    render json: { result: resulting_budget }
  end

  private

  def budget_params
    params.require(:budget).permit(:budget_amount)
    # puts budget_params.inspect
  end
end
