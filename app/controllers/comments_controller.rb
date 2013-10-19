class CommentsController < ApplicationController
  respond_to :json, only: [:index, :show]
  respond_to :html, :json, only: [:create, :destroy, :update]
  before_filter :authenticate_user!, only: [:create, :destroy, :edit, :index, :show, :update]
  before_filter :current_user_should_be_completed, only: [:create, :destroy, :edit, :update]
  before_filter :set_comment, only: [:destroy, :edit, :show, :update]

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user

    if @comment.trek && @comment.save
      respond_with @comment do |format|
        format.json do
          render json: { message: 'OK' }
        end
        format.html do
          make_notice Comment.model_name.human
          redirect_to trek_path(@comment.trek, anchor: "comment_#{@comment.id.to_s}")
        end
      end
    else
      respond_with @comment do |format|
        format.json do
          render json: { message: 'NG' }, status: 501
        end
        format.html do
          if @comment.trek
            redirect_to @comment.trek
          else
            redirect_to root_path
          end
        end
      end
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
    @comment.attributes = comment_params
    if @comment.trek && @comment.save
      respond_with @comment do |format|
        format.json {
          render json: { message: 'OK' }
        }
        format.html {
          make_notice Comment.model_name.human
          redirect_to @comment.trek
        }
      end
    else
      respond_with @comment do |format|
        format.json do
          render json: { message: 'NG' }, status: 501
        end
        format.html do
          if @comment.trek
            redirect_to trek_path(@comment.trek, anchor: "comment_#{@comment.id.to_s}")
          else
            redirect_to root_path
          end
        end
      end
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def comment_params
    params[:comment] # .require(:comment).permit(:acted_at, :content, :figure_id, :trek_id)
  end
end
