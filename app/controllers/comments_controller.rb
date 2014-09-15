class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def new
    @comment = @post.comments.build(parent_id: params[:parent_id])
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    if params[:comment][:parent_id].to_i > 0
      parent = @post.comments.find_by(id: params[:comment].delete(:parent_id))
      @comment = parent.children.build(comment_params)
      @comment.post = @post
    else
      @comment = @post.comments.create(comment_params)
    end

    if @comment.save
      flash[:success] = "Twój komentarz został dodany"    
      redirect_to @post
    else
      flash.now[:error] = "Komentarz nie został dodany"
      render :edit
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    if @comment.update(comment_params)
      flash[:success] = "Komentarz został zmieniony"
      redirect_to @post
    else
      render :edit
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
      redirect_to @post
      flash[:success] = "Komentarz został usunięty"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:podpis, :komentarz)
    end
end
