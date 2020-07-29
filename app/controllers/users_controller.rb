class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user

    #Login page
    def index
        @users = Users.all
        @memes = Meme.all
    end
    #New User 
    #def new
     #   @user = User.new
    #end
    #Create User 
    #def create
     #   @user = User.new(user_params)
      #  @user.save
    #end
    #Show User Page
    def show
        @user = User.find(params[:id])
    end
    #Edit User Page
    def edit
        @user = User.find(params[:id])
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
