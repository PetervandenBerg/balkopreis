class PreparationsController < ApplicationController

  def index
    @preparations = Preparation.all.order('created_at DESC')
  end

  def new
    @preparation = Preparation.new
  end 

  def edit
    @preparation = Preparation.find(params[:id])
  end

  def create
    @preparation = Preparation.new(preparation_params)

    respond_to do |format|
      if @preparation.save
        format.html { redirect_to preparations_path, notice: 'Voorbereiding was successfully created.' }
        format.json { render action: 'show', status: :created, location: @preparation }
      else
        format.html { render action: 'new' }
        format.json { render json: @preparation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @preparation = Preparation.find(params[:id])
    respond_to do |format|
      if @preparation.update(preparation_params)
        format.html { redirect_to preparations_path, notice: 'Voorbereiding was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @preparation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @preparation = Preparation.find(params[:id])
    @preparation.destroy
    respond_to do |format|
      format.html { redirect_to (preparations_path) }
      format.json { head :no_content }
    end
  end

  private 
    def preparation_params
      params.require(:preparation).permit(:admin_id, :title, :body)
    end

end