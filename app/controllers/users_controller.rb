class UsersController < ApplicationController
    #devise helper methods to check that someone is logged in
    before_action :authenticate_user!
    before_action :current_user

    #Login page
    def index
        
        @users = User.all
        @user = current_user
        @memes = Meme.all
    end

    #Show User Page
    def show
        @user = User.find(params[:id])
        @memes = @user.memes
    end
    #Edit User Page
    def edit
        @user = User.find(params[:id])
        @memes = @user.memes
    end
    #Update User Info
    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to :action => 'show', :id => @user
        else
            render 'edit'
        end
    end
    
    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
