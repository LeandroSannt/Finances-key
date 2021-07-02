class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]

  # GET /transactions or /transactions.json
  def index
    @transactions = current_user.transactions
    @categories = Category.where(user:current_user)
 
    @categories = @categories.where("lower(categories.name_category) LIKE ?", "%#{params[:filter].downcase}%") if params[:filter].present?

    @Appetizer = @transactions.where(situation: true).sum(:value)
    @withdraws = @transactions.where(situation: false).sum(:value)
    @balance =   @Appetizer + (@withdraws)

  end

  def filter_transactions
    
  end

  # GET /transactions/1 or /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions or /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    #binding.pry
    @transaction.situation == true  ? @transaction.value = @transaction.value.to_i * -1 : @transaction.value 
    @transaction.user = current_user

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: "Transação registrada com sucesso." }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    @transaction.situation == true  ? @transaction.value = @transaction.value.to_i * -1 : @transaction.value 
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: "Transação atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: "Transação excluida com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:name_transaction, :value, :date_transaction, :situation, :description, :category_id)
    end
end
