# 2018-04-21

# Title:
#   Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
#   Leopoldo Deogenes P. Cuesta II
#   BS-IT Student
#   AMA Computer University, College of East Rizal




class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  # GET /sections
  # GET /sections.json
  def index
    @sections = Section.order("position asc")

    authorize Section
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
    authorize Section
  end




  # GET /sections/new
  def new
    @section = Section.new
    @section_count = Section.count + 1
    authorize Section
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(section_params)

    authorize Section

    respond_to do |format|
      if @section.save
        format.html { redirect_to @section, notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
      else
        @section_count = Section.count + 1

        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end



    # GET /sections/1/edit
  def edit
    article = @section.article
    @section_count = article.sections.count
    authorize Section
  end


  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    authorize Section

    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to @section.article, notice: 'Section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
      else
        @section_count = article.sections.count
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end





  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    authorize Section
    
    @section.destroy
    respond_to do |format|
      format.html { redirect_to @section.article, notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:article_id, :image, :body, :position)
    end
end
