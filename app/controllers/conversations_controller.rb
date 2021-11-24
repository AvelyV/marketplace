class ConversationsController < ApplicationController
  before_action :authenticate_user!
  # before_action :correct_convo, only: %i[show]

  def index
    @users = User.all
    @conversations = Conversation.all
    
  end

  def create
    @conversation = if Conversation.between(params[:sender_id], params[:receiver_id]).present?
                      Conversation.between(params[:sender_id], params[:receiver_id]).first
                    else
                      Conversation.create!(conversation_params)
                    end
    redirect_to conversation_messages_path(@conversation)
  end

  private

  def conversation_params
    params.permit(:sender_id, :receiver_id)
  end

  def correct_convo
    # looking in the listings table, to see if current user has a listing that matches @listing id
    @conversation = current_user.conversations.find_by(id: params[:id])
    (redirect_to listings_path, notice: "Not authorised to access this conversation") if @conversation.nil?
  end
end
