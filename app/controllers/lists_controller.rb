class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks.includes(:movie) # Ensure bookmarks are loaded
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.image_url = 'default_image.jpeg' if @list.image_url.blank?
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :image_url)
  end
end
