class MemesController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user
    before_action :find_user, only: [:new, :create, :show, :edit, :update]

#Index isnt required because I will get Users#Index to list all Memes
#Destroy may be added later but I dont want to destroy art
    
#Due to DB, best way for me to understand how to create new
#meme was to create memes through User class.
    def new
        if @user != current_user
            redirect_to user_path(@user)
        end
        @meme = @user.memes.new
    end
#redirects to user show page where ideally I wish to have a list of memes on user page
    def create
        @meme = @user.memes.new(spiciness_checker)
       
        @meme.image.attach(spiciness_checker[:image])
        
        if @meme.save
            redirect_to user_path(@user)
        else
            render "new"
        end
    end

    #showo method has stripe payment button in it requiring a large method
    #comments is only seen within a meme, hence why it has no controller but is a model
    def show
        @meme = Meme.find(params[:id])
        @comment = @meme.comments
        
        session = Stripe::Checkout::Session.create(        
            payment_method_types: ['card'],        
            customer_email: current_user.email,        
           
            line_items: [{
                name: @meme.name,
                quantity: 1,
                currency: 'aud',
                amount: (@meme.price * 100).to_i,
                }],
            payment_intent_data: {           
                metadata: {               
                    user_id: current_user.id, 
                    meme_id: @meme.id           
                } 
            },        
            success_url: "#{root_url}payments/success?userId=#{current_user.id}&memeId=#{@meme.id}",
            cancel_url: "#{root_url}users/:user_id/memes/:meme_id"   
            
        )     
        @session_id = session.id 
            
        
    end

    #redirect to remove any1 other than person who owns meme from editing meme
    def edit
        @meme = @user.memes.find(params[:id])
        if @user != current_user
            redirect_to user_meme_path(@meme)
        end
    end
#if successful edit will send user to show where they can see changes in effect
    def update
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

    #cut down on DB calls
    def find_user
        @user = User.find(params[:user_id])
    end
end
