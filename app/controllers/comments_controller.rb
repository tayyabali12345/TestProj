class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show destroy ]
  before_action :set_post, only: %i[ create destroy ]

  def show
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id=current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_url(@post), notice: t('notice') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to post_url(@post), notice: t('notice') }
      else
        format.html { redirect_to post_url(@post), status: :unprocessable_entity }
      end
    end
  end

  private
    def set_comment
      @comment = Comment.find_by(id: params[:id])
    end

    def set_post
      @post = Post.find_by(id: params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end

end
