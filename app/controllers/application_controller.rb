class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    helper_method :main_categories
    
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
end
