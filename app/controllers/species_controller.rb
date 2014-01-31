class SpeciesController < ApplicationController
  def index
    @species = Species.all
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
    @species = Species.find(params[:id])
    @species.destroy

    respond_to do |format|
      format.html { redirect_to species_url }
      format.json { head :no_content }
    end
  end
end
