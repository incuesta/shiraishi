
# 2018-04-21

# Title:
#   Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
#   Leopoldo Deogenes P. Cuesta II
#   BS-IT Student
#   AMA Computer University, College of East Rizal


class ArticlesController < ApplicationController
  before_action :set_article, only: [:new_article_section, :create_article_section, :show, :edit, :update, :destroy]





  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.order("position asc")

    authorize Article
  end

  # GET /articles/1
  # GET /articles/1.json
  def show

    authorize Article
  end





  # GET /articles/new
  def new
    @article = Article.new
    @article_count = Article.count + 1

    authorize Article
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    authorize Article

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        @article_count = Article.count + 1

        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end





  # GET /articles/1/edit
  def edit
    @article_count = Article.count
    authorize Article
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    authorize Article

    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        @article_count = Article.count

        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end





  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    authorize Article

    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




  # GET /articles/1/new_article_section
  def new_article_section
    authorize Article

    @section = @article.sections.build
    @section_count = @article.sections.count + 1
  end


  # post /articles/create_article_section
  def create_article_section
    authorize Article

    @section = @article.sections.build(section_params)

    respond_to do | format |
      if @section.save
        format.html { redirect_to @article, notice: "Subsection successfully created!" }
      else
        @section_count = @article.sections.count + 1
        format.html { render 'new_article_section', notice: "Failed to create Subsection" }
      end
    end

  end






  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:image, :title, :body, :position)
    end

    def section_params
      params.require(:section).permit(:image, :body, :position)
    end
end
