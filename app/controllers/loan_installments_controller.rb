# 2018-04-21

# Title:
#   Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
#   Leopoldo Deogenes P. Cuesta II
#   BS-IT Student
#   AMA Computer University, College of East Rizal



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

      respond_to do | format |
          format.html

          format.pdf do
              issuer = ("#{current_accountant.last_name} #{current_accountant.first_name}" if current_accountant) || "ACGECCO"

              loan_installment_pdf = LoanInstallmentPdf.new(@loan_installment, view_context, issuer)

              send_data loan_installment_pdf.render, filename: 'loan_installment_receipt.pdf', type: 'application/pdf', disposition: 'inline'
          end
      end
  end





  # GET /loan_installments/new
  def new
    @loan_installment = LoanInstallment.new
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





  # GET /loan_installments/1/edit
  def edit
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




  # Set the status to paid
  def pay_installment
    set_loan_installment

    @loan = @loan_installment.loan_installment_container.loan

    

    respond_to do | format |
        
        if @loan.status == Loan.statuses[:disbursed]

            ae_exist = AccountingEntry.where(from_installment: @loan_installment.id).first

            unless ae_exist

                @loan_installment.update(loan_installment_params)

                

                # Record this in the Activity Log
                record(pundit_user, 'Accepted Payment')


                ab = @loan.accounting_book


                remaining_principal = ab.overall_principal_balance - @loan_installment.principal_amount
                remaining_interest = ab.overall_interest_balance - @loan_installment.interest_amount


                ae = ab.create_entry title: "Installment no #{@loan_installment.installment_no}", description: " Payment of #{@loan.client.full_name}", principal_balance: remaining_principal, interest_income_balance: remaining_interest, from_installment: @loan_installment.id
                ae.create_dr_entry description: "Cash", value: @loan_installment.principal_amount + @loan_installment.interest_amount
                ae.create_cr_entry description: "Account receivable", value: @loan_installment.principal_amount
                ae.create_cr_entry description: "Interest income", value: @loan_installment.interest_amount


                amount = (@loan_installment.principal_amount + @loan_installment.interest_amount)
                new_payment_email = LoanMailer.new_payment_notification(@loan, amount)
                new_payment_email.deliver_now
                
          
                ab.overall_principal_balance = remaining_principal
                ab.overall_interest_balance = remaining_interest

                ab.save
            end

            format.js { render 'loan_installments/pay_installment.js.erb' }
        else
            format.js { render 'loan_installments/pay_installment_failed.js.erb' }
        end
    end
  end


  # Set the status to unpaid
  def unpay_installment
    set_loan_installment
    @loan_installment.update(loan_installment_params)

    ae = AccountingEntry.where(from_installment: @loan_installment.id).first


    # note this has a bug wherein if you unpay it will mis-calculate AccountingEntry's principal_balance and interest_income Balance
    unless ae.nil?
        ab = ae.accounting_book
        ab.overall_principal_balance = ab.overall_principal_balance + ae.cr_entries.first.value
        ab.overall_interest_balance = ab.overall_interest_balance + ae.cr_entries.last.value
        ab.save

        ae.destroy
    end

    respond_to do | format |
        format.js { render 'loan_installments/unpay_installment.js.erb' }
    end
  end




  # Set a note
  def write_a_note
    set_loan_installment
    @loan_installment.update loan_installment_params
    
    respond_to do | format |
       format.js { render 'loan_installments/write_a_note.js.erb' }
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
