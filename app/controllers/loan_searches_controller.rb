class LoanSearchesController < ApplicationController
  before_action :set_loan_search, only: [:show, :edit, :update, :destroy]

  # Param Getters for Sorting
  helper_method :sort_order_param, :sort_column_param, :search_param





  # GET /loan_searches
  # GET /loan_searches.json
  def index
    @loan_searches = LoanSearch.all
  end

  # GET /loan_searches/1
  # GET /loan_searches/1.json
  def show
    @loans = @loan_search.loans

    respond_to do | format |
        format.html { render 'loans/index' }
    end
  end






  # GET /loan_searches/new
  def new
    @loan_search = LoanSearch.new
  end

  # POST /loan_searches
  # POST /loan_searches.json
  def create
    @loan_search = LoanSearch.new(loan_search_params)

    respond_to do |format|
      if @loan_search.save
        format.html { redirect_to @loan_search, notice: 'Search successfully carried out.' }
        format.json { render :show, status: :created, location: @loan_search }
      else
        format.html { render :new }
        format.json { render json: @loan_search.errors, status: :unprocessable_entity }
      end
    end
  end





  # GET /loan_searches/1/edit
  def edit
  end

  # PATCH/PUT /loan_searches/1
  # PATCH/PUT /loan_searches/1.json
  def update
    respond_to do |format|
      if @loan_search.update(loan_search_params)
        format.html { redirect_to @loan_search, notice: 'Loan search was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan_search }
      else
        format.html { render :edit }
        format.json { render json: @loan_search.errors, status: :unprocessable_entity }
      end
    end
  end





  # DELETE /loan_searches/1
  # DELETE /loan_searches/1.json
  def destroy
    @loan_search.destroy
    respond_to do |format|
      format.html { redirect_to loan_searches_url, notice: 'Loan search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end






  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_search
      @loan_search = LoanSearch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_search_params
      params.require(:loan_search).permit(:string_id, :client_last_name, :client_first_name, :client_middle_name, :loan_type_id, :application_date, :approved_date, :disbursement_date, :loan_status, :fully_paid)
    end






     # Url params for Sorting
    def sort_column_param
      params[:sort_column] || 'application_date'
    end

    def sort_order_param
      params[:sort_order] || 'desc'
    end


    def search_param
      params[:loans][:search] if params[:loans] || nil
    end
end
