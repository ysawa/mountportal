class FiguresController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!
  before_filter :find_figure, only: [:destroy]

  # POST /figures
  def create
    @figure = Figure.new(figure_params)
    @figure.user = current_user
    if @figure.save
      if @figure.content_image?
        render json: { id: @figure.id.to_s, image_url: @figure.image.url, message: 'OK' }
      else
        render json: { id: @figure.id.to_s, file_url: @figure.file.url, message: 'OK' }
      end
    else
      render json: { message: 'NG' }, status: 501
    end
  end

  # DELETE /figures
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
