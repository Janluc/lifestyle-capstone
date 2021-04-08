class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to articles_url
    else
      render @user
    end
  end

  def new_session
    @user = User.new
  end

  def create_session
    @user = User.find_by(name: user_params[:name])
    if @user
      session[:user_id] = @user.id
      redirect_to articles_url
    else
      render @user
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
