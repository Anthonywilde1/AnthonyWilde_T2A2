class MemesController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user

#Index isnt required because I will get Users#Index to list all Memes

    def new
        @user = User.find(params[:user_id])
        @meme = @user.memes.new
    end

    def create
        @user = User.find(params[:user_id])
        @meme = @user.memes.new(spiciness_checker)
        if @meme.save
            redirect_to @user
        else
            "new"
        end
    end

    def show
        @meme = Meme.find(params[:id])
    end

    def edit
        @meme = Meme.find(params[:id])
    end

    def update
        @meme = Meme.find(params[:id])

        if @meme.update(spiciness_checker)
            redirect_to :action => 'show', :id => @meme
        else
            render 'edit'
        end
    end

    private
    #params checker
    def spiciness_checker
        params.permit(:user_id, :name, :description, :image, :price, :category, :for_sale)
    end
end
