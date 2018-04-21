# 2018-04-21

# Title:
#     Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
#     Leopoldo Deogenes P. Cuesta II
#     BS-IT Student
#     AMA Computer University, College of East Rizal




class LoanManagerProfilesController < ApplicationController
    
    before_action :set_loan_manager_profile, only: [:show, :edit, :update, :destroy]

    # GET /loan_manager_profiles
    # GET /loan_manager_profiles.json
    def index
        @loan_manager_profiles = LoanManagerProfile.all
        authorize LoanManagerProfile
    end

    # GET /loan_manager_profiles/1
    # GET /loan_manager_profiles/1.json
    def show
        authorize @loan_manager_profile
    end




    # GET /loan_manager_profiles/new
    def new
        # If you use build it will delete your profile because of 1:1 relationship
        @loan_manager_profile = LoanManagerProfile.new

        authorize @loan_manager_profile

        # Redirect to update if there's already a Profile made.
        if current_loan_manager && current_loan_manager.loan_manager_profile
            redirect_to edit_loan_manager_profile_path(current_loan_manager.loan_manager_profile)
        elsif current_admin
            # If you're an Admin you don't need to create a Loan Manager profile instead register a Loan Manager
            redirect_to new_loan_manager_registration_path, notice: "Register a Loan Manager:"
        end
    end

    # POST /loan_manager_profiles
    # POST /loan_manager_profiles.json
    def create
        @loan_manager_profile = current_loan_manager.build_loan_manager_profile(loan_manager_profile_params)

        authorize @loan_manager_profile

        respond_to do |format|
            if @loan_manager_profile.save
                format.html { redirect_to @loan_manager_profile, notice: 'Loan manager profile was successfully created.' }
                format.json { render :show, status: :created, location: @loan_manager_profile }
            else
                format.html { render :new }
                format.json { render json: @loan_manager_profile.errors, status: :unprocessable_entity }
            end
        end
    end




    # GET /loan_manager_profiles/1/edit
    def edit
        authorize @loan_manager_profile
    end

    # PATCH/PUT /loan_manager_profiles/1
    # PATCH/PUT /loan_manager_profiles/1.json
    def update
        authorize @loan_manager_profile

        respond_to do |format|
            if @loan_manager_profile.update(loan_manager_profile_params)
                format.html { redirect_to @loan_manager_profile, notice: 'Loan manager profile was successfully updated.' }
                format.json { render :show, status: :ok, location: @loan_manager_profile }
            else
                format.html { render :edit }
                format.json { render json: @loan_manager_profile.errors, status: :unprocessable_entity }
            end
        end
    end




    # DELETE /loan_manager_profiles/1
    # DELETE /loan_manager_profiles/1.json
    def destroy
        authorize @loan_manager_profile

        @loan_manager_profile.destroy
        respond_to do |format|
            format.html { redirect_to loan_manager_profiles_url, notice: 'Loan manager profile was successfully destroyed.' }
            format.json { head :no_content }
        end
    end




    private

        # Use callbacks to share common setup or constraints between actions.
        def set_loan_manager_profile

            @loan_manager_profile = LoanManagerProfile.find(params[:id])

            
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def loan_manager_profile_params
            params.require(:loan_manager_profile).permit(:loan_manager_id, :image, :sex, :birth_date, :address, :city, :zip_code, :civil_status, :mobile, :company, :department, :employee_category, :job_title, :manager, :enabled)
        end
end
