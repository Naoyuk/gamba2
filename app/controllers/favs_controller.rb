class FavsController < ApplicationController
#  before_action :logged_in_user

  def create
    @fav = Fav.create(user_id: current_user.id, post_id: params[:post_id])
    @favs = Fav.where(post_id: params[:post_id])
    @posts = Post.all
  end

  def destroy
    fav = Fav.find(params[:id])
    @post = fav.post

  end
end
