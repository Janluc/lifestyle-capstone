class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  helper_method :main_categories
  helper_method :category_latest
  before_action :require_login

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def main_categories
    categ = Category.all

    if categ.length >= 4
      categ[0..3]
    else
      categ[0..categ.length - 1]
    end
  end

  def category_latest(category_name)
    categ = Category.find_by(name: category_name)
    categ.articles.last
  end

  def require_login
    redirect_to login_path unless current_user
  end
end
