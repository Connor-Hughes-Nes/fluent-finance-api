# TransactionController
class TransactionController < ApplicationController
  # :transaction_type
  # :transaction_amount
  # :total_income
  # :expense_id
  # :expense
  # :expense_date
  # :income_type
  # :income_id
  # :expense_amount
  # :expense_type

  def index
    @transactions = Transaction.all
    render json: @transactions
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      render json: @transaction, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # TODO: Check how i can do a show, with a specific value (expenses)
  #  + Pluralizing such values

  def show_expenses
    @expenses = Transaction(:expense)
    render json: @expenses
  end

  def capture_income
    @total_income = Transaction.new(transaction_params)

    if @total_income.save # total_income: params[:transaction_params]
      render json: @total_income, status: :created
    else
      render json: @total_income.errors, status: :unprocessable_entity
    end
  end

  def capture_expense
    @expense = Transaction.new(income_params)

    if @expense.save
      render json: @expense, status: :created
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  def calculate_budget
    # uses a permitted param of a parameter
    @total_income = params[:total_income].to_f
    @expense = params[:expense].to_f

    if @total_income.present?
      @resulting_budget = @total_income - @expense
    else
      render json: @resulting_budget.errors, status: :unprocessable_entity
    end

    render json: { result: @resulting_budget }
  end

  private

  def budget_params
    params.require(:budget).permit(:budget_amount)
  end

  def income_params
    params.require(:total_income).permit(:income_type)
  end

  def transaction_params
    # params.require(:transaction).permit(:transaction_type, :amount)
    params.permit :transaction_type, :transaction_amount, :total_income,
                  :expense, :income_type, :expense_amount, :expense_type
  end
end
