class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @transactions = Transaction.all.where(:user_id => current_user)
    respond_with(@transactions)
  end

  def show
    respond_with(@transaction)
  end

  def new
    @transaction = Transaction.new
    @stocks = Stock.all
    respond_with(@transaction)
  end

  def edit
    @stocks = Stock.all
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.save
    respond_with(@transaction)
  end

  def update
    @transaction.update(transaction_params)
    respond_with(@transaction)
  end

  def destroy
    @transaction.destroy
    respond_with(@transaction)
  end

  private
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    def transaction_params
      params.require(:transaction).permit(:transaction_type, :quantity, :rate, :currency, :gross_proceeds, :tax, :commission, :net_proceeds, :registration_date, :charge_date, :value_date, :user_id,:stock_id).merge(user_id: current_user.id)
    end
end
