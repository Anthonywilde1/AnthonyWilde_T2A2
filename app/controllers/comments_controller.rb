class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user
    before_action :find_comment, only: [:create, :edit, :update]
    


    def new
        @comments = Comment.new
    end

    def create
        @comments = Comment.new(comment_params)
        @comments.user_id = current_user.id
        if @comments.save 
            flash[:notice] = "Comment has been posted."
            redirect_to user_meme_path(@meme.user_id, @meme)
        else
            flash.now[:alert] = "comment has not been created."
            "new"
        end
    end

    def edit
       @usercheck = User.find(params[:user_id])
    end

    def update
       
        @comment = Comment.where(user_id: @user.id,meme_id: @meme.id )
        if @comment.update(comment_params)
             flash[:notice] = "Comment has been posted."
             redirect_to user_meme_path(@meme.user_id, @meme)
         else
             flash.now[:alert] = "comment has not been created."
             "edit"
         end
    
    end

    def destroy
        #need to find meme_id as just id as action is executed in the meme controller
        #I Know it sounds whack but its the only way it works dont @me
        
        @user = current_user
        @meme = Meme.find(params[:id])
        @comment = Comment.where(user_id: @user.id, meme_id: @meme.id)
        @meme.comments.destroy(@comment)
    end

    private
    def comment_params
        params.permit(:comment, :meme_id, :user_id)
    end

    #before actions find comment
    def find_comment
        @meme = Meme.find(params[:meme_id])
        @user = current_user
        @comment = Comment.where(user_id: @user.id, meme_id: @meme.id)
    end

    
    
end
