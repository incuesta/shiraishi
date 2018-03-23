class AdminProfilesController < ApplicationController
  before_action :set_admin_profile, only: [:show, :edit, :update, :destroy]
  
  


  # GET /admin_profiles
  # GET /admin_profiles.json
  def index
    @admin_profiles = AdminProfile.all

    authorize AdminProfile
  end

  # GET /admin_profiles/1
  # GET /admin_profiles/1.json
  def show
    authorize @admin_profile
  end




  # GET /admin_profiles/new
  def new
    # If you use build it will delete your profile because of 1:1 relationship
    @admin_profile = AdminProfile.new
    

    authorize @admin_profile

    # Redirect to update if there's already a Profile made.
    redirect_to edit_admin_profile_path(current_admin.admin_profile) if current_admin.admin_profile

  end

  # POST /admin_profiles
  # POST /admin_profiles.json
  def create
    @admin_profile = current_admin.build_admin_profile(admin_profile_params)


    authorize @admin_profile


    respond_to do |format|
      if @admin_profile.save
        format.html { redirect_to @admin_profile, notice: 'Admin profile was successfully created.' }
        format.json { render :show, status: :created, location: @admin_profile }
      else
        format.html { render :new }
        format.json { render json: @admin_profile.errors, status: :unprocessable_entity }
      end
    end
  end




   # GET /admin_profiles/1/edit
  def edit
      authorize @admin_profile
  end

  # PATCH/PUT /admin_profiles/1
  # PATCH/PUT /admin_profiles/1.json
  def update
      authorize @admin_profile

      respond_to do |format|
        if @admin_profile.update(admin_profile_params)
          format.html { redirect_to @admin_profile, notice: 'Admin profile was successfully updated.' }
          format.json { render :show, status: :ok, location: @admin_profile }
        else
          format.html { render :edit }
          format.json { render json: @admin_profile.errors, status: :unprocessable_entity }
        end
      end
  end




  # DELETE /admin_profiles/1
  # DELETE /admin_profiles/1.json
  def destroy
    authorize @admin_profile
    
    @admin_profile.destroy

    respond_to do |format|
      format.html { redirect_to admin_profiles_url, notice: 'Admin profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_profile
      @admin_profile = AdminProfile.find(params[:id])


      # # require same Admin
      # if @admin_profile.admin != current_admin && action_name != "show"
      #   redirect_to root_path, notice: "You're not allowed to do that..."
      # end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_profile_params
      params.require(:admin_profile).permit(:image, :sex, :birth_date, :address, :city, :zip_code, :civil_status, :mobile, :company, :department, :employee_category, :job_title, :manager)
    end

    
end
