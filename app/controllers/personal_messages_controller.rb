class PersonalMessagesController < ApplicationController
  before_action :find_conversation!, only: %i[create]

  def new
    @receiver = User.find(params[:receiver])
    @personal_message = current_user.personal_messages.build
  end

  def create
    if @conversation.nil?
      @conversation = Conversation.find_by(author_id: current_user.id,
        receiver_id: params[:receiver_id]) || Conversation.find_by(receiver_id: current_user.id,
          author_id: params[:receiver_id])
    end
    @conversation ||= Conversation.create(author_id: current_user.id,
                                          receiver_id: params[:receiver_id])
    @personal_message = current_user.personal_messages.build(personal_message_params)
    @personal_message.conversation_id = @conversation.id
    @personal_message.save!
    flash[:success] = "Your message was sent!"
    redirect_to conversation_path(@conversation)
  end

  private

  def personal_message_params
    params.require(:personal_message).permit(:body)
  end

  def find_conversation!
    @conversation = Conversation.find_by(id: params[:conversation_id])
  end
end
