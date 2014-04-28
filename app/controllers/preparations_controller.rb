class PreparationsController < ApplicationController

  def index
    @preparations = Preparation.all
  end

  def new
    @preparation = Preparation.new
  end 

  def create
    @preparation = Preparation.new(preparation_params)

    respond_to do |format|
      if @preparation.save
        format.html { redirect_to preparations_path, notice: 'Prepration was successfully created.' }
        format.json { render action: 'show', status: :created, location: @preparation }
      else
        format.html { render action: 'new' }
        format.json { render json: @preparation.errors, status: :unprocessable_entity }
      end
    end
  end

  private 
    def preparation_params
      params.require(:preparation).permit(:admin_id, :title, :body)
    end

end