class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: "Your list was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def list_params
    params.require(:list).permit(:name)
  end
end
