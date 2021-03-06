# 2018-04-21

# Title:
#   Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
#   Leopoldo Deogenes P. Cuesta II
#   BS-IT Student
#   AMA Computer University, College of East Rizal



class ClientProfilesController < ApplicationController
  before_action :set_client_profile, only: [:show, :show_guarantors, :show_assets, :show_loan_requests, :edit, :update, :destroy]


  layout :resolve_layout, only: [:show, :new, :edit, :show_guarantors, :show_assets, :show_loan_requests]


    # Param Getters for Sorting
  helper_method :sort_order_param, :sort_column_param, :search_param


  # GET /client_profiles
  # GET /client_profiles.json
  def index
    @client_profiles = ClientProfile.all

    authorize ClientProfile
  end

  # GET /client_profiles/1
  # GET /client_profiles/1.json
  def show
    authorize @client_profile
  end


  # GET /client_profiles/1/show_guarantors
  def show_guarantors
    @guarantors = @client_profile.client.guarantors
  end


  # GET /client_profiles/1/show_assets
  def show_assets
    @client_assets = @client_profile.client.client_assets
  end


  # GET /client_profiles/1/show_loan_request
  def show_loan_requests
    loans = @client_profile.client.loans
    sort_and_search loans
  end



  # GET /client_profiles/new
  def new
    @client_profile = ClientProfile.new
    authorize @client_profile
  end

  # POST /client_profiles
  # POST /client_profiles.json
  def create
    @client_profile = current_client.build_client_profile(client_profile_params)

    authorize @client_profile

    respond_to do |format|
      if @client_profile.save
        format.html { redirect_to @client_profile, notice: 'Client profile was successfully created.' }
        format.json { render :show, status: :created, location: @client_profile }
      else
        format.html { render :new, layout: 'public'}
        format.json { render json: @client_profile.errors, status: :unprocessable_entity }
      end
    end
  end




  # GET /client_profiles/1/edit
  def edit
    authorize @client_profile
  end

  # PATCH/PUT /client_profiles/1
  # PATCH/PUT /client_profiles/1.json
  def update
    authorize @client_profile
    respond_to do |format|
      if @client_profile.update(client_profile_params)
        format.html { redirect_to @client_profile, notice: 'Client profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @client_profile }
      else
        format.html { render :edit }
        format.json { render json: @client_profile.errors, status: :unprocessable_entity }
      end
    end
  end





  # DELETE /client_profiles/1
  # DELETE /client_profiles/1.json
  def destroy
    authorize @client_profile
    
    @client_profile.destroy
    respond_to do |format|
      format.html { redirect_to client_profiles_url, notice: 'Client profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_profile

        @client_profile = ClientProfile.find(params[:id])

        # if current_admin
        #       @client_profile = ClientProfile.find(params[:id])

        # else
        #       # Client can only edit their own
        #       @client_profile = ClientProfile.where(id: params[:id], client: current_client).first
        #       # Redirect if @client_profile is nil
        #       redirect_to new_client_profile_path, notice: "Not allowed..." unless @client_profile
        # end    
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_profile_params
        params.require(:client_profile).permit(:image, :sex, :birth_date, :address, :city, :zip_code, :civil_status, :mobile, :telephone, :company, :department, :employee_category, :job_title, :manager, :enabled)
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
