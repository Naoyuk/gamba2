class PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  private

    def post_params
      params[:post].permit(:region_id, :crag_id, :area_id, :route_id, :day, :result, :caption)
    end

end