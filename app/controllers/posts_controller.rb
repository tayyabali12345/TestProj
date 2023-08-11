class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy ]

  def index
    @posts = Post.all
  end

  def show
    @posted_comments=@post.comments.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id=current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: t('notice') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.nil? || @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: t('notice') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @post.nil? || @post.destroy
        format.html { redirect_to posts_url, notice: t('notice') }
      else
        format.html { redirect_to posts_url, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_post
      @post = Post.find_by(id: params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end

end
