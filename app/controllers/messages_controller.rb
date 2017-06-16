class MessagesController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :js

  def index
    @messages = Message.all

    @new_message = current_user.build_message

  end

  def create
    @message = current_user.build_message(message_params)

    if @message.save
      sync_new @message
    end

    respond_with { @message }
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end