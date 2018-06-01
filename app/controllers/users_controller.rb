class UsersController < ApplicationController
  before_action :set_record, only: [:show]
  
  def new
    @user = User.new
  end

  def show
  end

  private

    def set_record
      @user = User.find(params[:id])
    end
end
