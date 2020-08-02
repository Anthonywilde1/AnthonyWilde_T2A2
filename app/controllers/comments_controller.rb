class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user

    def new
        @user = User.find(params[:user_id])
        @meme = @user.memes.find([:meme_id])
        @comments = Comment.new
    end

    def create
        @user = User.find(params[:user_id])
        @meme = @user.memes.find([:meme_id])
        @comments = Comment.new(comment_params)
        if @comments.save 
            redirect_to @meme
        else
            "new"
        end
    end

    def edit
        @user = User.find(params[:user_id])
        @meme = @user.memes.find(params[:meme_id])
        @comments = @user.@memes.comments.find(params[:id])
    end

    def update
    end

    def destroy
    end

    private
    def comment_params
        params.require(:comment).permit(:comment, :user_id,:meme_id)
    end
end
