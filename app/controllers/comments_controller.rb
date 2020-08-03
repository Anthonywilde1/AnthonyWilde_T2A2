class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user

    def new
        @user = current_user.id
        @comments = Comment.new
    end

    def create
        @meme = Meme.find(params[:meme_id])
        @anchor = @meme.user_id
        @comments = Comment.new(comment_params)
        @comments.user_id = current_user.id
        if @comments.save 
            flash[:notice] = "Comment has been posted."
            redirect_to user_meme_path(@anchor, @meme)
        else
            flash.now[:alert] = "comment has not been created."
            "new"
        end
    end

    def edit
        @user = current_user
        @meme = @user.memes.find(params[:meme_id])
        @comments = @memes.comments.find(params[:id])
    end

    def update
    end

    def destroy
        @user = current_user
    end

    private
    def comment_params
        params.permit(:comment, :meme_id, :user_id)
    end

    
end
