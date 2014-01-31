class SpecimensController < ApplicationController
  # GET /specimens
  # GET /specimens.json
  def index
    @specimens = Specimen.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @specimens }
    end
  end

  # GET /specimens/1
  # GET /specimens/1.json
  def show
    @specimen = Specimen.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @specimen }
    end
  end

  # GET /specimens/new
  # GET /specimens/new.json
  def new
    @specimen = Specimen.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @specimen }
    end
  end

  # GET /specimens/1/edit
  def edit
    @specimen = Specimen.find(params[:id])
  end

  # POST /specimens
  # POST /specimens.json
  def create
    # species = Species.find_by_species_name(params[:specimen][:species_attributes][:species_name])
    @specimen = Specimen.new(params[:specimen])
    # @specimen.species_attributes = species if species.present?

    respond_to do |format|
      if @specimen.save
        format.html { redirect_to @specimen, notice: 'Specimen was successfully created.' }
        format.json { render json: @specimen, status: :created, location: @specimen }
      else
        format.html { render action: "new" }
        format.json { render json: @specimen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /specimens/1
  # PUT /specimens/1.json
  def update
    @specimen = Specimen.find(params[:id])

    respond_to do |format|
      if @specimen.update_attributes(params[:specimen])
        format.html { redirect_to @specimen, notice: 'Specimen was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @specimen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specimens/1
  # DELETE /specimens/1.json
  def destroy
    @specimen = Specimen.find(params[:id])
    @specimen.destroy

    respond_to do |format|
      format.html { redirect_to specimens_url }
      format.json { head :no_content }
    end
  end

end
