class PagesController < ApplicationController

  def home
  end

  def pictures
    @pictures = Picture.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 30)
  end

end
