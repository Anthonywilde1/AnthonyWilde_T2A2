class MemesController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user

#Index isnt required because I will get Users#Index to list all Memes
#Destroy may be added later but I dont want to destroy art
    
#Due to DB, best way for me to understand how to create new
#meme was to create memes through User class.
    def new
        @user = User.find(params[:user_id])
        @meme = @user.memes.new
    end
#redirects to user show page where ideally I wish to have a list of memes on user page
    def create
        @user = User.find(params[:user_id])
        @meme = @user.memes.new(spiciness_checker)
        if @meme.save
            redirect_to @user
        else
            "new"
        end
    end
#If malicious users try to enter wrong pathing it wont work
#Methods below see to that
    def show
        @user = User.find(params[:user_id])
        @meme = Meme.find(params[:id])
        @comment = @meme.comments
        pp params
    end


    def edit
        @user = User.find(params[:user_id])
        @meme = @user.memes.find(params[:id])
        
    end
#if successful edit will send user to show where they can see changes in effect
    def update
        @user = User.find(params[:user_id])
        @meme = @user.memes.find(params[:id])

        if @meme.update(spiciness_checker)
            redirect_to :action => 'show', :id => @meme
        else
            render 'edit'
        end
    end

#destroy method in future?

    private
    #params checker I wanted a fun name...
    def spiciness_checker
        params.permit(:user_id, :name, :description, :image, :price, :category, :for_sale)
    end
end
