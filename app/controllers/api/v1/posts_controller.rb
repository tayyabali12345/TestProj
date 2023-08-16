module Api
  module V1
    class PostsController < ApiController
      skip_before_action :verify_authenticity_token, only: [:destroy, :create, :update]

      def index
        @posts = Post.all
        serialized_posts = PostSerializer.new(@posts).serializable_hash # Serialize to hash
        render json: serialized_posts.to_json
      end

      def create
        @post = Post.new(post_params)
        if @post.save
          serialized_post = PostSerializer.new(@post).serializable_hash
          render json: { message: 'Post created successfully', post: serialized_post }, status: :created
        else
          render json: { message: 'Failed to create post', errors: @post.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        @post = Post.find(params[:id])
        serialized_post = PostSerializer.new(@post).serializable_hash
        render json: serialized_post.to_json
      end

      def destroy
        @post = Post.find_by(id: params[:id])
        if !@post.nil? && @post.destroy
          serialized_post = PostSerializer.new(@post).serializable_hash
          render json: { message: 'Post deleted successfully', post: serialized_post }, status: :ok
        else
          render json: { message: 'Failed to delete post' }, status: :unprocessable_entity
        end
      end

      def update
        @post = Post.find_by(id: params[:id])
        if !@post.nil? && @post.update(post_params)
          render json: { message: 'Post updated successfully' }, status: :ok
        else
          render json: { message: 'Failed to delete post' }, status: :unprocessable_entity
        end
      end

      private

      def post_params
        params.require(:post).permit(:title, :body, :user_id)
      end
    end
  end
end
