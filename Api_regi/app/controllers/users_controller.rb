class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end
   
    def show
        if logged_in?
            @user = fetch_user
            if @user.admin?
            @apis = Api.all
            else
            @apis = @user.api
            end
        else
            redirect_to root_path
        end
    end
    
    def create
        @user = User.new(user_params)
        @creator = Creator.create(user_params.except(:name))
        @creator.save
        if @user.save
            log_in @user
            flash[:success] = "Welcome to the App viewer"
            redirect_to @user
        else
            render 'new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end
    def fetch_user
      @user = User.find(session[:user_id])
    end
end
