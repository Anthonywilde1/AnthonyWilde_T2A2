class PaymentsController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user
    skip_before_action :verify_authenticity_token, only: [:webhook]

    def success 

    end

    def webhook
        puts "transferring ownership"
        pp params
        puts "-----------------------"
        Meme.find(params[:meme_id]).update(user_id: current_user) 
        puts "ownership transfered to #{current_user.username}"
        puts "-----------------------"

        payment_id = params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retieve(payment_id)
        meme_id = payment.metadata.meme_id
        user_id = payment.metadata.user_id

        p "meme id" + meme_id
        p "user_id" + user_id

        head :ok
        
    end
end
