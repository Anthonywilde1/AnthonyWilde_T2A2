class MemesController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user

    def new
        @meme = Meme.new
    end

    def create
        @meme = Meme.new(spiciness_checker)
        if @meme.save
            redirect_to '/users/:id'
        else
            "new"
        end
    end
end
