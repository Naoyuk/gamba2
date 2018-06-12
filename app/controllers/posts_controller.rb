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

  def crags_select
    if request.xhr?
      render partial: 'crags', locals: {style: params[:style], region_id: params[:region_id]}
    end
  end

  def areas_select
    if request.xhr?
      render partial: 'areas', locals: {crag_id: params[:crag_id]}
    end
  end

  def routes_select
    if request.xhr?
      render partial: 'routes', locals: {area_id: params[:area_id]}
    end
  end

  private

    def post_params
      params.require(:post).permit(
        :region_id,
        :crag_id,
        :area_id,
        :route_id,
        :day,
        :result,
        :caption,
        :picture
      )
    end

end
