class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]

    def success 

    end

    def webhook
        
         
        #this is the method for stripe payments
        payment_id = params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        meme_id = payment.metadata.meme_id
        user_id = payment.metadata.user_id
        Meme.find(meme_id).update(user_id: user_id)

        p "meme id" + meme_id
        p "user_id" + user_id

        head :ok
        
    end
end
