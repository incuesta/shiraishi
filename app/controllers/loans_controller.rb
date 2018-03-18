class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :edit, :update, :destroy, :show_loan_disbursion, :show_accounting_for_loan]


  # Param Getters for Sorting
  helper_method :sort_order_param, :sort_column_param, :search_param






  # GET /loans
  # GET /loans.json
  def index
    sort_and_search(Loan.all)
    @search_path = loans_path
  end





  # The Following are index Variants
  # So that we could restrict each with Pundit
  # GET /loans/requested_loans
  def requested_loans
    sort_and_search(Loan.requested_loans)
    @search_path = requested_loans_loans_path
    

    respond_to do | format |
        format.html { render 'index' }
        
        format.pdf do
            issuer = ("#{current_accountant.last_name} #{current_accountant.first_name}" if current_accountant) || "ACGECCO"

            loans_pdf = LoansPdf.new(@loans, view_context, issuer, "Requested loans", action_name)

            send_data loans_pdf.render, filename: 'requested_loans.pdf', type: 'application/pdf', disposition: 'inline'
          
        end
    end
  end




  # GET /loans/approved_loans
  def approved_loans
    sort_and_search(Loan.approved_loans)
    @search_path = approved_loans_loans_path
    
    respond_to do | format |
        format.html { render 'index' }
        
        format.pdf do
            issuer = ("#{current_accountant.last_name} #{current_accountant.first_name}" if current_accountant) || "ACGECCO"

            loans_pdf = LoansPdf.new(@loans, view_context, issuer, "Approved loans", action_name)

            send_data loans_pdf.render, filename: 'approved_loans.pdf', type: 'application/pdf', disposition: 'inline'
          
        end
    end
  end





  # GET /loans/approved_loans
  def approved_loans_for_disbursion
    sort_and_search(Loan.approved_loans)
    @search_path = approved_loans_for_disbursion_loans_path
    render 'approved_loans_for_disbursion'
  end




  # GET /loans/rejected_loans
  def rejected_loans
    sort_and_search(Loan.rejected_loans)
    @search_path = rejected_loans_loans_path

    respond_to do | format |
        format.html { render 'index' }
        
        format.pdf do
            issuer = ("#{current_accountant.last_name} #{current_accountant.first_name}" if current_accountant) || "ACGECCO"

            loans_pdf = LoansPdf.new(@loans, view_context, issuer, "Rejected Loan Request", action_name)

            send_data loans_pdf.render, filename: 'rejected_loans.pdf', type: 'application/pdf', disposition: 'inline'
          
        end
    end
  end




  # GET /loans/disbursed_loans
  def disbursed_loans
    sort_and_search(Loan.disbursed_loans)
    @search_path = disbursed_loans_loans_path

     respond_to do | format |
        format.html { render 'disbursed_loans' }
        
        format.pdf do
            issuer = ("#{current_accountant.last_name} #{current_accountant.first_name}" if current_accountant) || "ACGECCO"

            loans_pdf = LoansPdf.new(@loans, view_context, issuer, "Disbursed loans", action_name)

            send_data loans_pdf.render, filename: 'disbursed_loans.pdf', type: 'application/pdf', disposition: 'inline'
          
        end
    end
  end




  # GET /loans/undisbursed_loans
  def undisbursed_loans
    sort_and_search(Loan.undisbursed_loans)
    @search_path = undisbursed_loans_loans_path
    
    respond_to do | format |
        format.html { render 'index' }
        
        format.pdf do
            issuer = ("#{current_accountant.last_name} #{current_accountant.first_name}" if current_accountant) || "ACGECCO"

            loans_pdf = LoansPdf.new(@loans, view_context, issuer, "Undisbursed Loan Request", action_name)

            send_data loans_pdf.render, filename: 'undisbursed_loans.pdf', type: 'application/pdf', disposition: 'inline'      
        end
    end
  end



  # These are loans whose unpaid installments exceeds 3
  # GET /loans/red_listed_loans
  def red_listed_loans
    sort_and_search Loan.red_listed_loans

    respond_to do |format|
      format.html { render 'index' }
    end
  end




  # GET /loans/1
  # GET /loans/1.json
  def show
    @loan_installments = @loan.loan_installment_container.loan_installments unless @loan.loan_installment_container.nil?
  end


  # GET /loans/1
  # This page will have a disbursion button
  def show_loan_disbursion
    @loan_installments = @loan.loan_installment_container.loan_installments unless @loan.loan_installment_container.nil?
  end


  # GET /loans/1/show_accounting_for_loan
  # This will show the Accouting Entry for a particular Loan
  def show_accounting_for_loan
    @accounting_book = @loan.accounting_book
    @accounting_entries = @accounting_book.accounting_entries
  end





  # GET /loans/new
  def new
    @loan = Loan.new
    @loan_types = LoanType.all
  end

  # POST /loans
  # POST /loans.json
  def create
    if current_client
      @loan = current_client.loans.build(loan_params)
    elsif current_admin || current_loan_manager || current_accountant
      @loan = Loan.new(loan_params)
    end

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

            # Send a notification
            approved_mail = LoanMailer.new_approved_loan @loan
            approved_mail.deliver_now

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

          # Send a notification
          rejected_mail = LoanMailer.new_rejected_loan @loan
          rejected_mail.deliver_now

          format.js { render "loans/reject_the_loan.js.erb" }
        end
      end
  end


  # Sets the status of the Loan to "disbursed"
  # PATCH /loans/reject_the_loan/1
  def disburse_the_loan
      set_loan
      respond_to do | format |
        if (@loan.status == Loan.statuses[:approved] || @loan.status == Loan.statuses[:disbursed]) && @loan.update(loan_params_origin)
          
          # If the status is disbursed, create an AccountingBook with Entries
          if @loan.status == Loan.statuses[:disbursed]


              accounting_book = @loan.build_accounting_book
              accounting_book.name = "Book for #{@loan.string_id}"
              accounting_book.overall_principal_balance = @loan.principal_amount
              accounting_book.overall_interest_balance = @loan.principal_amount * @loan.loan_type.rate

              accounting_entry = accounting_book.create_entry title: "Disbursed the loan", description: " Loaned to #{@loan.client.full_name}", principal_balance: accounting_book.overall_principal_balance, interest_income_balance: accounting_book.overall_interest_balance
              accounting_entry.create_dr_entry description: "Account receivable", value: @loan.principal_amount
              accounting_entry.create_cr_entry description: "Cash", value: @loan.principal_amount

              accounting_book.save


              # Send a notification
              disbursed_mail = LoanMailer.new_disbursed_loan @loan
              disbursed_mail.deliver_now
              

          end


          format.js { render "loans/disburse_the_loan.js.erb"}

        else


          # Render failure message
          format.js { render "loans/disbursion_failed.js.erb" }
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
      params.require(:loan).permit(:client_id, :string_id, :loan_type_id, :application_date, :approved_date, :disbursement_date, :status, :principal_amount, :from, :to, :net_loan, :net_interest, :notes, :fully_paid, loan_doc_ids: [])
    end


    def loan_params

      params_hash = loan_params_origin

      
      principal = params_hash[:principal_amount]      
      interest = LoanType.find(params_hash[:loan_type_id]).rate * principal.to_d

      client = (current_client if current_client) || Client.find(params_hash[:client_id])

      params_hash[:string_id] = Loan.identification_string(client) unless @loan
      params_hash[:application_date] = Time.zone.now
      params_hash[:from] = Time.zone.now
      params_hash[:to] = Time.zone.now.next_year
      params_hash[:net_loan] = principal.to_d + interest
      params_hash[:net_interest] = interest
      params_hash
    end




    # Refactored Index Search and Sorting
    def sort_and_search(loans)
      if search_param
        @loans = loans.list_with_loan_type_and_client.order("#{sort_column_param} #{sort_order_param}").simple_search search_param
      else
        @loans = loans.list_with_loan_type_and_client.order("#{sort_column_param} #{sort_order_param}")
      end
    end





    # Url params for Sorting
    def sort_column_param
      params[:sort_column] || 'application_date'
    end

    def sort_order_param
      params[:sort_order] || 'desc'
    end




    # Url params for Simple Search
    def search_param
      params[:loans][:search] if params[:loans] || nil
    end
    
end
