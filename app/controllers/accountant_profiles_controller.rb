class AccountantProfilesController < ApplicationController
    before_action :set_accountant_profile, only: [:show, :edit, :update, :destroy]

    # GET /accountant_profiles
    # GET /accountant_profiles.json
    def index
        @accountant_profiles = AccountantProfile.all
    end

    # GET /accountant_profiles/1
    # GET /accountant_profiles/1.json
    def show
    end

    # GET /accountant_profiles/new
    def new
        @accountant_profile = AccountantProfile.new

        # Redirect to update if there's already a Profile made.
        if current_accountant && current_accountant.accountant_profile
            redirect_to edit_accountant_profile_path(current_accountant.accountant_profile)
        elsif current_admin
            # If you're an Admin you don't need to create a Loan Manager profile instead register a Loan Manager
            redirect_to new_accountant_registration_path, notice: "Register a #{current_controller} Manager:"
        end
    end

    # GET /accountant_profiles/1/edit
    def edit
    end

    # POST /accountant_profiles
    # POST /accountant_profiles.json
    def create
        @accountant_profile = current_accountant.build_accountant_profile(accountant_profile_params)

        respond_to do |format|
            if @accountant_profile.save
                format.html { redirect_to @accountant_profile, notice: 'Accountant profile was successfully created.' }
                format.json { render :show, status: :created, location: @accountant_profile }
            else
                format.html { render :new }
                format.json { render json: @accountant_profile.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /accountant_profiles/1
    # PATCH/PUT /accountant_profiles/1.json
    def update
        respond_to do |format|
            if @accountant_profile.update(accountant_profile_params)
                format.html { redirect_to @accountant_profile, notice: 'Accountant profile was successfully updated.' }
                format.json { render :show, status: :ok, location: @accountant_profile }
            else
                format.html { render :edit }
                format.json { render json: @accountant_profile.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /accountant_profiles/1
    # DELETE /accountant_profiles/1.json
    def destroy
        @accountant_profile.destroy
        respond_to do |format|
            format.html { redirect_to accountant_profiles_url, notice: 'Accountant profile was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
        

        # Use callbacks to share common setup or constraints between actions.
        def set_accountant_profile
            
            if current_admin
                  @accountant_profile = AccountantProfile.find(params[:id])
            end

            # Loan Managers can only edit their own
            @accountant_profile = AccountantProfile.where(id: params[:id], accountant: current_accountant).first

            # Redirect if @loan_manager_profile is nil
            redirect_to new_accountant_profile_path, notice: "Create a Profile to do that..." unless @accountant_profile
        end



        # Never trust parameters from the scary internet, only allow the white list through.
        def accountant_profile_params
            params.require(:accountant_profile).permit(:accountant_id, :image, :sex, :birth_date, :address, :city, :zip_code, :civil_status, :mobile, :company, :department, :employee_category, :job_title, :manager, :enabled)
        end
end
