class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy like dislike ]

  def index
    @posts = Post.includes(:reactions).all
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

  def like
    toogle_reaction(true)
    redirect_to posts_url
  end

  def dislike
    toogle_reaction(false)
    redirect_to posts_url
  end

  private

    def toogle_reaction(reaction_type)
      existing_reaction = Reaction.find_by(user_id: current_user.id, likeable_id: @post.id, likeable_type: "Post")
      if existing_reaction && existing_reaction.like == reaction_type
        existing_reaction.destroy
      elsif existing_reaction==nil
        @post.reactions.create(user_id: current_user.id, like: reaction_type)
      else
        @post.reactions.update(like: reaction_type)
      end
    end

    def set_post
      @post = Post.find_by(id: params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end

end
