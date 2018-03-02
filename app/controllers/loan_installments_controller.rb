class LoanInstallmentsController < ApplicationController
  before_action :set_loan_installment, only: [:show, :edit, :update, :destroy]

  # GET /loan_installments
  # GET /loan_installments.json
  def index
    @loan_installments = LoanInstallment.all
  end

  # GET /loan_installments/1
  # GET /loan_installments/1.json
  def show
  end

  # GET /loan_installments/new
  def new
    @loan_installment = LoanInstallment.new
  end

  # GET /loan_installments/1/edit
  def edit
  end

  # POST /loan_installments
  # POST /loan_installments.json
  def create
    @loan_installment = LoanInstallment.new(loan_installment_params)

    respond_to do |format|
      if @loan_installment.save
        format.html { redirect_to @loan_installment, notice: 'Loan installment was successfully created.' }
        format.json { render :show, status: :created, location: @loan_installment }
      else
        format.html { render :new }
        format.json { render json: @loan_installment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loan_installments/1
  # PATCH/PUT /loan_installments/1.json
  def update
    respond_to do |format|
      if @loan_installment.update(loan_installment_params)
        format.html { redirect_to @loan_installment, notice: 'Loan installment was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan_installment }
      else
        format.html { render :edit }
        format.json { render json: @loan_installment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_installments/1
  # DELETE /loan_installments/1.json
  def destroy
    @loan_installment.destroy
    respond_to do |format|
      format.html { redirect_to loan_installments_url, notice: 'Loan installment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_installment
      @loan_installment = LoanInstallment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_installment_params
      params.require(:loan_installment).permit(:installment_no, :client, :from, :to, :principal_amount, :interest_amount, :decimal, :emi_installment, :state, :notes)
    end
end
