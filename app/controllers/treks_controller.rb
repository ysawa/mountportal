class TreksController < ApplicationController
  before_action :set_trek, only: [:destroy, :edit, :show, :update]

  # POST /treks
  def create
    @trek = Trek.new(trek_params)

    if @trek.save
      redirect_to @trek, notice: 'Trek was successfully created.'
    else
      render action: 'new'
    end
  end

  # DELETE /treks/1
  def destroy
    @trek.destroy
    redirect_to treks_url, notice: 'Trek was successfully destroyed.'
  end

  # GET /treks/1/edit
  def edit
  end

  # GET /treks
  def index
    @treks = Trek.all
  end

  # GET /treks/new
  def new
    @trek = Trek.new
  end

  # GET /treks/1
  def show
  end

  # PATCH/PUT /treks/1
  def update
    if @trek.update(trek_params)
      redirect_to @trek, notice: 'Trek was successfully updated.'
    else
      render action: 'edit'
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_trek
    @trek = Trek.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def trek_params
    params.require(:trek).permit(:name)
  end
end
