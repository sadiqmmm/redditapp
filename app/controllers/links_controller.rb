class LinksController < ApplicationController
	before_action :set_link, only: [:show, :edit, :update, :destroy]

  def index
  	@links = Link.all
  end

  def show
  end

  def new
  	@link = Link.new
  end

  def create
  	@link = Link.new(link_params)

  	if @link.save
  		flash[:notice] = "Created link successfully."
  		redirect_to @link
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
    if @link.update(link_params)
      flash[:notice] = "Updated link successfully."
      redirect_to @link
    else
      render "edit"
    end
  end

  def destroy
    @link.destroy
    
    flash[:notice] = "Link deleted successfully."
    redirect_to links_path
  end

  private

    def set_link
    	@link = Link.find(params[:id])
    end

    def link_params
    	params.require(:link).permit(:title, :url)
    end    
end
