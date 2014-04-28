class KindsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @kinds = Kind.all
  end 

  def new
    @kind = Kind.new
  end

  def create
    @kind = Kind.new(kind_params)

    respond_to do |format|
      if @kind.save
        format.html { redirect_to kinds_path, notice: 'Kind was successfully created.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @kind.errors, status: :unprocessable_entity }
      end
    end
  end 

  def destroy
    @kind = Kind.find(params[:id])
    @kind.destroy
    respond_to do |format|
      format.html { redirect_to (kinds_path) }
      format.json { head :no_content }
    end
  end 

  private

    def kind_params
      params.require(:kind).permit(:name)
    end

end