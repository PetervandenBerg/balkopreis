class LinksController < ApplicationController
  before_filter :authenticate_admin!

  def new
    @links = Link.all
  end

  def create
    @link = Link.new(kind_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to new_link_path, notice: 'Link was successfully created.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end 

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    respond_to do |format|
      format.html { redirect_to (links_path) }
      format.json { head :no_content }
    end
  end 

  private

    def kind_params
      params.require(:link).permit(:name, :link)
    end

end