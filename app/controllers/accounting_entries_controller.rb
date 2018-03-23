class AccountingEntriesController < ApplicationController
  before_action :set_accounting_entry, only: [:show, :edit, :update, :destroy]


  helper_method :sort_order_param, :sort_column_param, :search_param




  # GET /accounting_entries
  # GET /accounting_entries.json
  def index
    @accounting_entries = AccountingEntry.all

    authorize AccountingEntry
  end

  # GET /accounting_entries/1
  # GET /accounting_entries/1.json
  def show
    authorize AccountingEntry
  end



  # Shows the journal of all loans
  def show_all_loan_entries
    @loans = Loan.disbursed_loans.paginate(page: params[:page], per_page: 2)

    authorize AccountingEntry
  end


  # Shows income summary
  def show_income_summary
    @loans = Loan.disbursed_loans.paginate(page: params[:page], per_page: 5)

    authorize AccountingEntry
  end





  # GET /accounting_entries/new
  def new
    @accounting_entry = AccountingEntry.new

    authorize AccountingEntry
  end


  # POST /accounting_entries
  # POST /accounting_entries.json
  def create
    @accounting_entry = AccountingEntry.new(accounting_entry_params)

    authorize AccountingEntry

    respond_to do |format|
      if @accounting_entry.save
        format.html { redirect_to @accounting_entry, notice: 'Accounting entry was successfully created.' }
        format.json { render :show, status: :created, location: @accounting_entry }
      else
        format.html { render :new }
        format.json { render json: @accounting_entry.errors, status: :unprocessable_entity }
      end
    end
  end





  # GET /accounting_entries/1/edit
  def edit
    authorize AccountingEntry
  end

  # PATCH/PUT /accounting_entries/1
  # PATCH/PUT /accounting_entries/1.json
  def update
    authorize AccountingEntry

    respond_to do |format|
      if @accounting_entry.update(accounting_entry_params)
        format.html { redirect_to show_accounting_for_loan_loan_path(@accounting_entry.accounting_book.loan), notice: 'Accounting entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @accounting_entry }
      else
        format.html { render :edit }
        format.json { render json: @accounting_entry.errors, status: :unprocessable_entity }
      end
    end
  end





  # DELETE /accounting_entries/1
  # DELETE /accounting_entries/1.json
  def destroy
    @accounting_entry.destroy

    authorize AccountingEntry
    
    respond_to do |format|
      format.html { redirect_to accounting_entries_url, notice: 'Accounting entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accounting_entry
      @accounting_entry = AccountingEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accounting_entry_params
      params.require(:accounting_entry).permit(:title, :entry_date, :principal_balance, :interest_income_balance, :description)
    end





    # Url params for Sorting
    def sort_column_param
      params[:sort_column] || 'entry_date'
    end

    def sort_order_param
      params[:sort_order] || 'desc'
    end




    # Url params for Simple Search
    def search_param
      params[:loans][:search] if params[:accounting_entries] || nil
    end
    
end
