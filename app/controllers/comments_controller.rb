class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user

    def new
        @user = User.find(params[:user_id])
        @meme = @user.memes.find(params[:meme_id])
        @comments = Comment.new
    end

    def create
        #@user = User.find(params[:id])
        #@meme = @user.memes.find(params[:id])
        @comments = Comment.new(comment_params)
        if @comments.save 
            #redirect_to user_meme_url(@meme)
            #I cant figure this out for right now
            redirect_to :controller => 'memes', :action => 'show', meme_id: Comment.meme_id, user_id: Comment.user_id
        else
            "new"
        end
    end

    def edit
        @user = User.find(params[:user_id])
        @meme = @user.memes.find(params[:meme_id])
        @comments = @memes.comments.find(params[:id])
    end

    def update
    end

    def destroy
    end

    private
    def comment_params
        params.permit(:comment, :user_id,:meme_id)
    end
end
