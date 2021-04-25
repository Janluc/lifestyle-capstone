class UsersController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to articles_url
    else
      redirect_to new_user_path, alert: 'Invalid Username'
    end
  end

  def show
    @user = User.includes(articles: :category).find(params[:id])
    @articles = @user.articles
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
      redirect_to login_path, alert: 'Invalid Username'
    end
  end

  def destroy_session
    reset_session
    redirect_to '/login'
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
