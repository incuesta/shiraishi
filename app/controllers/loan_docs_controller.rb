# 2018-04-21

# Title:
#   Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
#   Leopoldo Deogenes P. Cuesta II
#   BS-IT Student
#   AMA Computer University, College of East Rizal



class LoanDocsController < ApplicationController
  before_action :set_loan_doc, only: [:show, :edit, :update, :destroy]

  # GET /loan_docs
  # GET /loan_docs.json
  def index
    @loan_docs = LoanDoc.all

    authorize LoanDoc
  end

  # GET /loan_docs/1
  # GET /loan_docs/1.json
  def show
    authorize LoanDoc
  end

  # GET /loan_docs/new
  def new
    @loan_doc = LoanDoc.new
    authorize LoanDoc
  end

  # GET /loan_docs/1/edit
  def edit
    authorize LoanDoc
  end

  # POST /loan_docs
  # POST /loan_docs.json
  def create
    @loan_doc = LoanDoc.new(loan_doc_params)

    authorize LoanDoc

    respond_to do |format|
      if @loan_doc.save
        format.html { redirect_to @loan_doc, notice: 'Loan doc was successfully created.' }
        format.json { render :show, status: :created, location: @loan_doc }
      else
        format.html { render :new }
        format.json { render json: @loan_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loan_docs/1
  # PATCH/PUT /loan_docs/1.json
  def update
    authorize LoanDoc

    respond_to do |format|
      if @loan_doc.update(loan_doc_params)
        format.html { redirect_to @loan_doc, notice: 'Loan doc was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan_doc }
      else
        format.html { render :edit }
        format.json { render json: @loan_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_docs/1
  # DELETE /loan_docs/1.json
  def destroy
    authorize LoanDoc
    
    @loan_doc.destroy
    respond_to do |format|
      format.html { redirect_to loan_docs_url, notice: 'Loan doc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_doc
      @loan_doc = LoanDoc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_doc_params
      params.require(:loan_doc).permit(:name, :compulsory)
    end
end
