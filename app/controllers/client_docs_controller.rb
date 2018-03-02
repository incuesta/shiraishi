class ClientDocsController < ApplicationController
  before_action :set_client_doc, only: [:show, :edit, :update, :destroy]

  # GET /client_docs
  # GET /client_docs.json
  def index
    @client_docs = ClientDoc.all
  end

  # GET /client_docs/1
  # GET /client_docs/1.json
  def show
  end

  # GET /client_docs/new
  def new
    @client_doc = ClientDoc.new
  end

  # GET /client_docs/1/edit
  def edit
  end

  # POST /client_docs
  # POST /client_docs.json
  def create
    @client_doc = ClientDoc.new(client_doc_params)

    respond_to do |format|
      if @client_doc.save
        format.html { redirect_to @client_doc, notice: 'Client doc was successfully created.' }
        format.json { render :show, status: :created, location: @client_doc }
      else
        format.html { render :new }
        format.json { render json: @client_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_docs/1
  # PATCH/PUT /client_docs/1.json
  def update
    respond_to do |format|
      if @client_doc.update(client_doc_params)
        format.html { redirect_to @client_doc, notice: 'Client doc was successfully updated.' }
        format.json { render :show, status: :ok, location: @client_doc }
      else
        format.html { render :edit }
        format.json { render json: @client_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_docs/1
  # DELETE /client_docs/1.json
  def destroy
    @client_doc.destroy
    respond_to do |format|
      format.html { redirect_to client_docs_url, notice: 'Client doc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_doc
      @client_doc = ClientDoc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_doc_params
      params.require(:client_doc).permit(:name, :submitted)
    end
end
