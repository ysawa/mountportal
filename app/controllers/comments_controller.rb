class CommentsController < ApplicationController
  respond_to :json, only: [:create, :index, :show, :update]
  respond_to :html, :json, only: [:destroy]
  before_action :authenticate_user!, only: [:create, :destroy, :edit, :index, :show, :update]
  before_action :current_user_should_be_completed, only: [:create, :destroy, :edit, :update]
  before_action :set_comment, only: [:destroy, :edit, :show, :update]

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment
    else
      render json: { message: 'NG' }, status: 501
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  # GET /comments/1/edit
  def edit
  end

  # GET /comments
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  def show
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: { message: 'NG' }, status: 501
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def comment_params
    params.require(:comment).permit(:content, :trek_id)
  end
end
