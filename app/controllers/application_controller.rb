class ApplicationController < ActionController::Base
    add_flash_types(:danger)


    private

    def require_signin
        unless current_user
            session[:intended_url] = request.url
            redirect_to new_session_url, alert: "Please sign in first!"
        end
    end

    def require_correct_user
        @user = User.find(params[:id])
        unless current_user == @user
          redirect_to root_url,notice: "you are not a current user"
        end
    end

    helper_method :current_user
    def current_user
        User.find(session[:user_id]) if session[:user_id]
    end

    def require_admin
        unless current_user_admin?
          redirect_to root_url, alert: "Unauthorized access!"
        end
    end
    helper_method :current_user_admin?
    def current_user_admin?
        current_user && current_user.admin
    end

    
end
