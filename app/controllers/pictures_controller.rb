class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :get_blog
  before_filter :authenticate_admin!, only: [:new, :edit, :create, :update]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = @blog.pictures
  end

  def new
    @blog = Blog.find(params[:blog_id])
    @picture = @blog.pictures.build
  end

  def create
    @picture = @blog.pictures.build(picture_params)

    respond_to do |format|
      if @picture.save
        format.html { redirect_to blog_path(@blog), notice: 'Picture was successfully created.' }
        format.json { render action: 'show', status: :created, location: @picture }
      else
        format.html { render action: 'new' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @picture = @blog.pictures.find(params[:id])
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to (blog_pictures_path(@blog)) }
      format.json { head :no_content }
    end
  end

  private

    def get_blog
      @blog = Blog.find(params[:blog_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:blog_id, :image)
    end
end
