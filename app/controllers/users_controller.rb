class UsersController < ApplicationController
    before_action :authenticate_user!

    #Login page
    
    def index
        @users = User.all
        @memes = Meme.all
    end
    #New User 
    def new
        @user = User.new
    end
    #Create User 
    def create
        @user = User.new(user_params)
        @user.save
    end
    #Show User Page
    def show
        @user = User.find(params[:id])
    end
    #Edit User Page
    def edit
        @user = User.find(params[:id])
    end
    #Delete User Page?


    private
    def user_params
        require(:user).permit(:username, :email, :password)
    end
end
