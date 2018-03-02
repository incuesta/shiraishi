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
  end

  # GET /loans/1/edit
  def edit
  end

  # POST /loans
  # POST /loans.json
  def create
    @loan = current_client.build_loan(loan_params)

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

  # PATCH/PUT /loans/1
  # PATCH/PUT /loans/1.json
  def update
    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to @loan, notice: 'Loan was successfully updated.' }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_params_origin
      params.require(:loan).permit(:string_id, :application_date, :approved_date, :disbursement_date, :status, :principal_amount, :from, :to, :principal_amount, :net_loan, :net_interest, :notes)
    end


    def loan_params

      interest = 10

      params_hash = loan_params_origin
      params_hash[:string_id] = "loan_#{ '%04d' % [current_client.id]}_#{Time.zone.now.to_i}"
      params_hash[:application_date] = Time.zone.now
      params_hash[:from] = Time.zone.now
      params_hash[:to] = Time.zone.now.next_year
      params_hash[:net_loan] = params_hash[:principal_amount].to_d + interest;
      params_hash[:net_interest] = interest
      params_hash[:status] = "request"
      params_hash
    end
end



"%s/%s.%04d.txt" % ["dirname", "filename", 23]