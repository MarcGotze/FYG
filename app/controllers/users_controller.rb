class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if user.update(user_params)
      redirect_to users_path(user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    User.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
