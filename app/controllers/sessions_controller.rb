class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # 一時セッションを開始してPost一覧(root_path)へ移動する
      log_in user
      remember user
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination.'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
