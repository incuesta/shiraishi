class ClientAssetsController < ApplicationController
  before_action :set_client_asset, only: [:show, :edit, :update, :destroy]



  layout :resolve_layout, only: [:index, :show, :new, :edit]


  # GET /client_assets
  # GET /client_assets.json
  def index
    @client_assets = ClientAsset.all
  end

  # GET /client_assets/1
  # GET /client_assets/1.json
  def show
    @client= @client_asset.client
  end





  # GET /client_assets/new
  def new
    @client_asset = ClientAsset.new
  end

  # POST /client_assets
  # POST /client_assets.json
  def create
    if current_client
      @client_asset = current_client.client_assets.build(client_asset_params)
    else
      @client_asset = ClientAsset.new(client_asset_params)
    end

    respond_to do |format|
      if @client_asset.save
        format.html { redirect_to @client_asset, notice: 'Client asset was successfully created.' }
        format.json { render :show, status: :created, location: @client_asset }
      else
        format.html { render :new }
        format.json { render json: @client_asset.errors, status: :unprocessable_entity }
      end
    end
  end





  # GET /client_assets/1/edit
  def edit
    @client = @client_asset.client
  end

  # PATCH/PUT /client_assets/1
  # PATCH/PUT /client_assets/1.json
  def update
    respond_to do |format|
      if @client_asset.update(client_asset_params)
        format.html { redirect_to @client_asset, notice: 'Client asset was successfully updated.' }
        format.json { render :show, status: :ok, location: @client_asset }
      else
        format.html { render :edit }
        format.json { render json: @client_asset.errors, status: :unprocessable_entity }
      end
    end
  end





  # DELETE /client_assets/1
  # DELETE /client_assets/1.json
  def destroy
    @client_asset.destroy
    respond_to do |format|
      format.html { redirect_to client_assets_url, notice: 'Client asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_asset
      @client_asset = ClientAsset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_asset_params
      params.require(:client_asset).permit(:client_id, :image, :name, :description)
    end
end
