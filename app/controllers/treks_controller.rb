class TreksController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :edit, :new, :update]
  before_action :current_user_should_be_completed, only: [:create, :destroy, :edit, :new, :update]
  before_action :set_trek, only: [:destroy, :edit, :show, :update]

  # POST /treks
  def create
    @trek = Trek.new(trek_params)
    @trek.creator = current_user

    if @trek.save
      make_notice(Trek.model_name.human)
      redirect_to @trek
    else
      render action: 'new'
    end
  end

  # DELETE /treks/1
  def destroy
    @trek.destroy
    make_notice(Trek.model_name.human)
    redirect_to treks_url
  end

  # GET /treks/1/edit
  def edit
  end

  # GET /treks
  def index
    if user_signed_in?
      @treks = Trek.all
    else
      @treks = Trek.published
    end
    @treks = @treks.desc(:scheduled_from_date, :scheduled_from_time)
  end

  # GET /treks/new
  def new
    @trek = Trek.new(published: true)
  end

  # GET /treks/1
  def show
  end

  # PATCH/PUT /treks/1
  def update
    if @trek.update(trek_params)
      make_notice(Trek.model_name.human)
      redirect_to @trek
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
    params.require(:trek).permit(:name, :picture_id, :published, :scheduled_from, :scheduled_to, :scheduled_from_date, :scheduled_to_date, :scheduled_from_time, :scheduled_to_time)
  end
end
