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
    @transaction = transactions.new(transaction_params)

    if @transaction.save transaction_params[:transaction_type], transaction_params[:amount]
      render json: @transaction, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def capture_income
    @total_income = Transaction.new(income_params)

    if @total_income.save
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
    budget = params[:budget].to_f
    expense = params[:expense].to_f

    resulting_budget = budget - expense

    render json: { result: resulting_budget }
  end

  private

  def budget_params
    params.require(:budget).permit(:budget_amount)
  end

  def income_params
    params.require(:income).permit(:income_type)
  end

  # def set_transaction
  #   @transaction = transaction.find
  # end

  def transaction_params
    # params.require(:transaction).permit(:transaction_type, :amount)
    params.permit :transaction_type, :amount

  end
end
