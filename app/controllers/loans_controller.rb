class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :edit, :update, :destroy]





  # GET /loans
  # GET /loans.json
  def index
    @loans = Loan.all
  end

  # GET /loans/1
  # GET /loans/1.json
  def show
    @loan_installments = @loan.loan_installment_container.loan_installments unless @loan.loan_installment_container.nil?
  end





  # GET /loans/new
  def new
    @loan = Loan.new
    @loan_types = LoanType.all
  end

  # POST /loans
  # POST /loans.json
  def create
    @loan = current_client.loans.build(loan_params)

    respond_to do |format|
      if @loan.save
        format.html { redirect_to @loan, notice: 'Loan request was successfully submitted.' }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :new }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end





  # GET /loans/1/edit
  def edit
    @loan_types = LoanType.all
  end

  # PATCH/PUT /loans/1
  # PATCH/PUT /loans/1.json
  def update
    respond_to do |format|
      if @loan.update(loan_params)

        format.html { redirect_to @loan, notice: 'Loan details, updated' }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end





  # DELETE /loans/1
  # DELETE /loans/1.json
  def destroy
    @loan.destroy
    respond_to do |format|
      format.html { redirect_to loans_url, notice: 'Loan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end





  def compute_installments
        set_loan

        @loan_installment_container = @loan.create_loan_installment_container!


        # Generate some Loan Installments
        @loan_installments = @loan_installment_container.calculate

        respond_to do | format | 
            format.html { render 'loan_installments/index' }
            format.js { render 'loan_installments/computed_installments.js.erb' }
        end
  end





  # Sets the status of the Loan to "approved"
  # PATCH /loans/approve_the_loan/1
  def approve_the_loan
      set_loan

      # Evaluate validity of request
      request_valid = @loan.evaluate_request

      respond_to do | format |
        if request_valid && @loan.update(loan_params_origin)
            format.js { render "loans/approve_the_loan.js.erb" }
        else
            format.js { render "loans/invalid_loan_request.js.erb" }
        end
      end
  end

  # Sets the status of the Loan to "rejected"
  # PATCH /loans/reject_the_loan/1
  def reject_the_loan
      set_loan
      respond_to do | format |
        if @loan.update(loan_params_origin)
          format.js { render "loans/reject_the_loan.js.erb" }
        end
      end
  end





# Check if the Client have submitted the Documents
# PATCH /loans/update_submitted_docs/1
  def update_submitted_docs
      set_loan
      respond_to do | format | 
          if @loan.update(loan_params_origin)
            format.js { render "loans/update_submitted_docs.js.erb" }
            format.html { redirect_to loans_path, notice: "Updated" }
          end
      end
  end






  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_params_origin
      params.require(:loan).permit(:string_id, :loan_type_id, :application_date, :approved_date, :disbursement_date, :status, :principal_amount, :from, :to, :net_loan, :net_interest, :notes, :fully_paid, loan_doc_ids: [])
    end


    def loan_params

      params_hash = loan_params_origin

      
      principal = params_hash[:principal_amount]      
      interest = LoanType.find(params_hash[:loan_type_id]).rate * principal.to_d

      params_hash[:string_id] = Loan.identification_string(current_client) unless @loan
      params_hash[:application_date] = Time.zone.now
      params_hash[:from] = Time.zone.now
      params_hash[:to] = Time.zone.now.next_year
      params_hash[:net_loan] = principal.to_d + interest
      params_hash[:net_interest] = interest
      params_hash
    end
end
