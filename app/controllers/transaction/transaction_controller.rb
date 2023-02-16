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
    # @income = Transaction.find_by(id: params[:income_id])
    @transaction = transactions.new(transaction_params)
                # @income.

    if @transaction.save
      render json: @transaction, status: :created, location: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def capture_income
    @total_income = Transaction.new(income_params)

    if @total_income.save
      render json: @total_income, status: :created, location: @total_income
    else
      render json: @total_income.errors, status: :unprocessable_entity
    end
  end

  def capture_expense
    @expense = Transaction.new(income_params)

    if @expense.save
      render json: @expense, status: :created, location: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  def calculate_budget
    budget = params[:budget].to_f
    expense = params[:expense].to_f

    resulting_budget = budget - expense

    render json: {result: resulting_budget}
  end

  private

  def budget_params
    params.require(:budget).permit(:budget_amount)
  end

  def income_params
    params.require(:income).permit(:income_type)
  end

  def transaction_params
    params.require(:transaction).permit(:transaction_type, :amount)
  end


end
