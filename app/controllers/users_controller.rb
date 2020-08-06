class UsersController < ApplicationController
    #devise helper methods to check that someone is logged in
    before_action :authenticate_user!
    before_action :current_user
    before_action :find_user, only: [:show, :edit, :update]

    #Login page
    def index
        @users = User.all
        @user = current_user
        @memes = Meme.all
    end

    #Show User Page
    def show
        @memes = @user.memes
    end
    #Edit User Page
    def edit
        if @user != current_user
            redirect_to user_path(@user)
        end
        @memes = @user.memes
    end
    #Update User Info
    def update

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
