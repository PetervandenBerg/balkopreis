class PicturesController < ApplicationController
  before_action :set_picture, only: [:edit, :update, :destroy]
  before_filter :authenticate_admin!, only: [:new, :edit, :update]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end 

  def new
    @blog = Blog.find(params[:blog_id])
    @picture = @blog.pictures.build
  end

  def create
    if @blog.present?
      @blog = Blog.find(params[:id])
      @picture = @blog.pictures.build(picture_params)
    else
      @picture = Picture.new(picture_params)
    end

    respond_to do |format|
      if @picture.save
        if @picture.blog.present?
          format.html { redirect_to blog_path(@picture.blog), notice: 'Picture was successfully created.' }
          format.json { render action: 'show', status: :created, location: @blog }
        else 
          format.html { redirect_to pages_pictures_path, notice: 'Picture was successfully created.' }
          format.json { render action: 'show', status: :created, location: @picture }
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    respond_to do |format|
      if @picture.blog.present?
        format.html { redirect_to (blog_path(@picture.blog)) }
        format.json { head :no_content }
      else
        format.html { redirect_to (pages_pictures_path) }
        format.json { head :no_content }
      end
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:blog_id, :image, :kind_id)
    end
end
