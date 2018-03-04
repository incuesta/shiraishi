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
        format.html { redirect_to @loan, notice: 'Loan was successfully created.' }
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

        format.html { redirect_to @loan, notice: 'Loan evaluated.' }
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


  def compute_installment
        set_loan

        from_date = Time.zone.now
        end_date = from_date + 1.month

        principal_amount = @loan.principal_amount / 12
        interest_amount = principal_amount * @loan.loan_type.rate
        monthly_emi = principal_amount + interest_amount

        12.times do | i |
          from_date += 1.month unless i == 0
          end_date += 1.month unless i == 0


          LoanInstallment.create(installment_no: i + 1, client: @loan.client.full_name, from: from_date, to: end_date, principal_amount: principal_amount, interest_amount: interest_amount, emi_installment: monthly_emi)
        end

        redirect_to loan_installments_path
  end



  # Sets the status of the Loan to "approved"
  # PATCH /loans/1
  def approve_the_loan
      set_loan
      respond_to do | format |
        if @loan.update(loan_params_origin)
          format.js { render "loans/approve_the_loan.js.erb" }
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
      params.require(:loan).permit(:string_id, :loan_type_id, :application_date, :approved_date, :disbursement_date, :status, :principal_amount, :from, :to, :net_loan, :net_interest, :notes)
    end


    def loan_params

      params_hash = loan_params_origin


      interest = 10
      principal = params_hash[:principal_amount]

      

      params_hash[:string_id] = "LOAN-#{ '%03d' % [(current_client.id if current_client) || @loan.client.id]}#{Time.zone.now.to_i}"
      params_hash[:application_date] = Time.zone.now
      params_hash[:from] = Time.zone.now
      params_hash[:to] = Time.zone.now.next_year
      params_hash[:net_loan] = principal.to_d + interest
      params_hash[:net_interest] = interest
      params_hash
    end
end
