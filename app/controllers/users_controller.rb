class UsersController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update]
  before_action :set_record, only: [:show]

  def show
  end

  def profile
    @user = current_user
    render 'profile'
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Gamba!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

    def set_record
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
