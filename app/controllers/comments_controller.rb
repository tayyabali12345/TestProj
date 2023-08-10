class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy like dislike ]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id=current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_url(@post), notice: "Comment was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
    end
  end

  def like
    toogle_reaction(true)
    redirect_to post_path(@comment.post)
  end

  def dislike
    toogle_reaction(false)
    redirect_to post_path(@comment.post)
  end

  private

    def toogle_reaction(reaction_type)
      existing_reaction = Reaction.find_by(user_id: current_user.id, likeable_id: @comment.id)
      if existing_reaction && existing_reaction.like == reaction_type
        existing_reaction.destroy
      elsif existing_reaction==nil
        @comment.reactions.create(user_id: current_user.id, like: reaction_type)
      else
        @comment.reactions.update(like: reaction_type)
      end
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
