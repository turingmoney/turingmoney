class PaymentsController < ApplicationController
  def create
    user = User.where(funding_address: params[:address], funding_secret: params[:secret]).first
    if user
      Payment.create(
        user_id: user.id,
        address: params[:address]
        value: params[:value]
        destination_address: params[:destination_address],
        input_address:params[:input_address],
        input_transaction_hash:params[:input_transaction_hash],
        transaction_hash:params[:transaction_hash],
      )
    end
  end
end