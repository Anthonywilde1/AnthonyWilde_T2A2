class UsersController < ApplicationController
    #before_action :authenticate_user!

    #Login page
    
    def index
        @users = User.all
    end
    #New User Page
    def new
    @user = User.new
    end
    #Create User Page
    def create
    @user = User.new(user_params)
    @user.save
    end
    #Show User Page

    #Edit User Page

    #Delete User Page?


    private
    def user_params
        require(:user).permit(:username, :email, :password)
    end
end
