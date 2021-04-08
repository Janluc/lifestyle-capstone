class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    helper_method :main_categories
    helper_method :category_latest
    
    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

    def main_categories
       categ = Category.all
       
       categ[0..3]
    end

    def category_latest(category_name)
        categ = Category.find_by(name: category_name)
        categ.articles.last
    end
end
