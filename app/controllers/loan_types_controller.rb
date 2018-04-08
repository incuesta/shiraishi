class LoanTypesController < ApplicationController
  before_action :set_loan_type, only: [:show, :edit, :update, :destroy]

  # GET /loan_types
  # GET /loan_types.json
  def index
    @loan_types = LoanType.all

    authorize LoanType
  end

  # GET /loan_types/1
  # GET /loan_types/1.json
  def show

    authorize LoanType
  end

  # GET /loan_types/new
  def new
    @loan_type = LoanType.new
    @loan_docs = LoanDoc.all

    authorize LoanType
  end

  # GET /loan_types/1/edit
  def edit
    @loan_docs = LoanDoc.all

    authorize LoanType
  end

  # POST /loan_types
  # POST /loan_types.json
  def create
    @loan_type = LoanType.new(loan_type_params)
    @loan_docs = LoanDoc.all

    authorize LoanType

    respond_to do |format|
      if @loan_type.save
        format.html { redirect_to @loan_type, notice: 'Loan type was successfully created.' }
        format.json { render :show, status: :created, location: @loan_type }
      else
        format.html { render :new }
        format.json { render json: @loan_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loan_types/1
  # PATCH/PUT /loan_types/1.json
  def update
    @loan_docs = LoanDoc.all
    authorize LoanType
    

    respond_to do |format|
      if @loan_type.update(loan_type_params)
        format.html { redirect_to @loan_type, notice: 'Loan type was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan_type }
      else
        format.html { render :edit }
        format.json { render json: @loan_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_types/1
  # DELETE /loan_types/1.json
  def destroy
    @loan_type.destroy

    authorize LoanType
    
    respond_to do |format|
      format.html { redirect_to loan_types_url, notice: 'Loan type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_type
      @loan_type = LoanType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_type_params
      params.require(:loan_type).permit(:name, :code, :interest_mode, :rate, :repayment_method, :duration, :minimum, :maximum, loan_doc_ids: [])
    end
end
