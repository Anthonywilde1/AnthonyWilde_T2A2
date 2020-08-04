class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user
    before_action :find_comment, only: [:create, :edit, :delete, :update]

    def new
        @comments = Comment.new
    end

    def create
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

    def delete
        params
        @comment.destroy
        #if respond_to do |format| 
            #format.html {redirect_to user_meme_path(@meme.user_id, @meme), notice: "the cheese has been eaten, it was cheesy."}format.json{head: no_content}
    
        #end
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
