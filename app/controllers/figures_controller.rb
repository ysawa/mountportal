class FiguresController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!
  before_filter :find_figure, only: [:destroy]

  # POST /admin/figures
  def create
    @figure = Figure.new(figure_params)
    @figure.user = current_user
    if @figure.save
      render json: { id: @figure.id, url: @figure.image.url, message: 'OK' }
    else
      render json: { message: 'NG' }, status: 501
    end
  end

  # DELETE /admin/figures
  def destroy
    if @figure.destroy
      render json: { message: 'OK' }
    else
      render json: { message: 'NG' }, status: 501
    end
  end

private

  def find_figure
    @operation_target = @figure = Figure.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def figure_params
    params.require(:figure).permit(:content)
  end
end
