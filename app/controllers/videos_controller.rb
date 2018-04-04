class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.order("position asc")

    authorize Video
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    authorize Video
  end



  # GET /videos/new
  def new
    @video = Video.new
    @video_count = Video.count + 1
    authorize Video
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    authorize Video

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        @video_count = Video.count + 1
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end



  # GET /videos/1/edit
  def edit
    @video_count = Video.count
    authorize Video
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    authorize Video
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        @video_count = Video.count
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    authorize Video
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params_origin
      params.require(:video).permit(:video_id, :host, :title, :description, :position, :tags)
    end

    def video_params
      video_params = video_params_origin
      video_params[:host] = video_params[:host].underscore if video_params[:host]
      video_params[:tags] = video_params[:tags].underscore if video_params[:tags]
      video_params
    end
end
